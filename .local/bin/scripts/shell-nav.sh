
if [[ $# -eq 1 ]]; then 
  echo "Invalid arguments"
  exit 0
fi

if [[ $# -eq 2 ]]; then
  slot=$1
  target_path=$
else 
  slot=$1
  target_path=$(find ~/Code -mindepth 1 -maxdepth 1 -type d | fzf)
fi 
