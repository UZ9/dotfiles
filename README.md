# dotfiles
My personal configuration files.

## School Manager

### Problem

Notes for a class are stored under my [Obsidian](https://obsidian.md/) Vault, but there are often additional non-note files required. These might be code projects, practice tests, or standalone portable programs.

An easy solution to this issue is to just have a folder for each class:

```
.
├── Class1/
│   ├── Notes
│   └── Files
├── Class2/
│   ├── Notes
│   └── Files
├── Class3/
│   ├── Notes
│   └── Files
└── Class4/
    ├── Notes
    └── Files
```

However, we encounter a few issues with this approach:
- If I was in Class1 and wanted to quickly check something in Class2, changing directories can be quite clunky and a distraction from the actual content
- Notes are isolated for each class, preventing [internal links](https://help.obsidian.md/Linking+notes+and+files/Internal+links) (one of the main features of Obsidian)
- The Obsidian GUI would attempt to read all files as well

This inevitably has led to the very inconvenient workflow cycle of shuffling between multiple locations for notes, and a rapidly deteriorating folder structure as the semester progresses:
- Lecture notes are taken in class and put in the Obsidian Vault
- Homework assignments in latex are introduced, requiring the use of a very specific template. Obsidian is good at embedding latex snippets via [MathJax](https://www.mathjax.org/), but not when it comes to fully standalone `.tex` files. Consequently, these have to be moved to a separate folder.
- A code-related project is introduced in the class. It doesn't make sense 

### Solution

I wanted a system robust enough to always provide a consistent location for notes, but give me the flexibility of adding more folders of non-note content if needed. At the end of the day, the Obsidian notes should all be grouped together, both to allow easier navigation and to allow me to access the notes from a phone:

```
.
└── $OBSIDIAN_VAULT/
    └── Classes/
        └── FALL2024/
            ├── Class1/
            │   └── <markdown note files>
            ├── Class2/
            │   └── <markdown note files>
            ├── Class3/
            │   └── <markdown note files>
            └── Class4/
                └── <markdown note files>
```


The final solution is a combination of [tmux](https://github.com/tmux/tmux/wiki) and [symbolic links](https://en.wikipedia.org/wiki/Symbolic_link):

```
.
└── FALL2024/
    ├── Class1/
    │   ├── Notes (symlink) -> $OBSIDIAN_VAULT/Classes/FALL2024/Class1
    │   └── Files
    ├── Class2/
    │   ├── Notes (symlink) -> $OBSIDIAN_VAULT/Classes/FALL2024/Class2
    │   └── Files
    ├── Class3/
    │   ├── Notes (symlink) -> $OBSIDIAN_VAULT/Classes/FALL2024/Class3
    │   └── Files
    └── Class4/
        ├── Notes (symlink) -> $OBSIDIAN_VAULT/Classes/FALL2024/Class4
        └── Files
```

### Workflow

At any given point in time, I can access my Obsidian vault through the standard GUI from any device (synchronized via [Syncthing]([Syncthing](https://syncthing.net/))). However, most of the time I navigate via terminal:

1. When I have tmux (a session manager for persisting terminal state after closing) open, I have a keybind `<prefix>P` for opening the school manager script.
2. The current semester is identified by the current date. August-December is Fall semester, and January-May is Spring semester. 
3. The script will prompt me to either select an existing course through [fzf](https://github.com/junegunn/fzf) (fuzzy finder) or create a new course. 
4. If a new course is inputted, a folder on Obsidian for the course will be generated, and a new directory under `Classes`  will be created with a symlink to Obsidian and a `Files` directory. 
5. A tmux session at the course directory is either created or restored, allowing per-class session management. 
6. Any note changes from the symlink will be propagated to all other devices, allowing all notes to be accessible via a mobile device.
