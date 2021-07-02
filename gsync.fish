function gsync --description 'Deletes all [gone] branches from local and syncs local with remote'
    git fetch --prune
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
    git pull
end
