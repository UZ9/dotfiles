#!/bin/bash

# Plans for school manager:
# 2-key search through projects (similar to <prefix> ctrl+F for code, <prefix> ctrl-P for school..?)
# Defaults to current semester, but one of the options is previous semesters 
# If choose previous semesters, list semesters and ask to choose 
# In a current semester, show a list of classes
# Once choosing a class, create new tmux session in that directory 
# 2 files: Files folder, and Notes (sym link to obsidian)
#
# On creating new class:
# - create new folder for the course under Semester/course
# Example: FALL2024/CS1332
# - establish sym link to folder in obsidian 
# Example: sym link to ~/link/to/obsidian/011 Classes/FALL2024/CS1332 "notes"
# - create Files folder
#
# Other plans:
# New tmux run script system:
# auto-run script when we reach a particular session 
# useful applications:
# if we want to a school-related topic e.g. physics,
# split the pane, left half is showing obsidian notes 

PROJECT_DIRECTORY=/tmp/schoolmanager
OBSIDIAN_DIRECTORY=/mnt/c/Users/chess/ObsidianVault
OBSIDIAN_CLASSES_DIRECTORY="$OBSIDIAN_DIRECTORY/005 Classes"

# calculate current semester
# semester dates: August-December (8-12), January-May ( 0-5 )
month=$(date +%m)
year=$(date +%y)

semester=""

if [[ $month -gt 5 ]]; then
  semester="FALL$year"
else
  semester="SPRING$year"
fi


semester_folder="$PROJECT_DIRECTORY/$semester"
echo "$semester_folder"

# create semester if not exists
if ! [ -e "$semester_folder" ]; then 
  echo "Could not find $semester_folder, creating it now"
  mkdir "$semester_folder"
fi

add_new_class="Add new class"

# search folders within this path 
selected_class="$( (echo "$add_new_class"; ( find "$semester_folder" -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 basename -a)) | fzf)"

if [[ "$add_new_class" == "$selected_class" ]]; then
  read -rp "Class Name: " new_class
  echo "chose: $new_class"
  selected_class=$new_class

  # initialize folder contents
  mkdir "$semester_folder/$selected_class"

  # create obsidian note directory
  obsidian_semester_directory="$OBSIDIAN_CLASSES_DIRECTORY/$semester"
  obsidian_notes_directory="$obsidian_semester_directory/$selected_class"

  if ! [[ -e "$obsidian_semester_directory" ]]; then 
    echo "Semester directory $obsidian_semester_directory not found, creating"
    mkdir "$obsidian_semester_directory"
  fi

  if ! [[ -e "$obsidian_notes_directory" ]]; then 
    echo "Class directory $obsidian_notes_directory not found, creating"
    mkdir "$obsidian_notes_directory"
  fi

  # symlink obsidian 
  ln -s "$obsidian_notes_directory" "$semester_folder/$selected_class/notes"

  # create files directory 
  mkdir "$semester_folder/$selected_class/files"
fi

echo "$selected_class"

class_folder="$semester_folder/$selected_class"
session_name=$selected_class

# create tmux session
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then 
  tmux new-session -s "$session_name" -c "$class_folder" 
  exit 0
fi 

if ! tmux has-session -t="$session_name" 2> /dev/null; then
  tmux new-session -ds "$session_name" -c "$class_folder"
fi 

tmux switch-client -t "$session_name"
