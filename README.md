# fish-tank

My fish tank for all fish-related configs and function files. Inspired by [fish-functions](https://github.com/razzius/fish-functions) by [@razzius](https://github.com/razzius). 

## Contents

* [Git Utilities](#git-utilities)
  * [`gb-clear`](#gb-clear)
  * [`gitc`](#gitc-message)
  * [`wip`](#wip-message)
  
## Git Utilities

### `gb-clear`

[Source](./gb-clear.fish)

### `gitc [message]`

[Source](./gitc.fish)

Like `git commit -m` without the need to quote the commit message. This also prefixes the commit message with the branch name.

If no commit message is given and there's only 1 file changed, commit "(Add / Update / Delete) (that file)".

```bash
sharynneazhar at sharynnes-mbp in ~/D/s/nc_integration_service on TF2-661 [!]
↪ gitc Remove changes for different story
[TF2-661 914690de] TF2-661 Remove changes for different story
 1 file changed, 4 deletions(-)
```

### `wip [message]`

[Source](./wip.fish)

Adds untracked changes and commits them with a WIP message. Additional arguments are added to the WIP message.
