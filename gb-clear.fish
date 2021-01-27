// Arguments: NA

function gb-clear --description 'deletes all [gone] remote branches from local'
  git fetch --prune
  git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
end
