# fish-tank

My fish tank for all fish-related configs and function files. Inspired by [fish-functions](https://github.com/razzius/fish-functions) by [@razzius](https://github.com/razzius). 

## Contents

* [Git Utilities](#git-utilities)
  * [`gb-clear`](#gb-clear)
  * [`gitc`](#gitc-message)
  * [`gsync`](#gsync)
  * [`wip`](#wip-message)
  
## Git Utilities

### `gb-clear`

[Source](./gb-clear.fish)

Deletes all "gone" remote branches from local machine.

### `gitc [message]`

[Source](./gitc.fish)

Like `git commit -m` without the need to quote the commit message. This also prefixes the commit message with the branch name.

If no commit message is given and there's only 1 file changed, commit "(Add / Update / Delete) (that file)".

### `gsync`

[Source](./gsync.fish)

Deletes all "gone" remote branches from local machine and sync current checked out branch with remote.

### `wip [message]`

[Source](./wip.fish)

Adds untracked changes and commits them with a WIP message. Additional arguments are added to the WIP message.
