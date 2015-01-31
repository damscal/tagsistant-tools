# tagsistant-tools
Tools for using [tagsistant](http://www.tagsistant.net/)

## commands
`commands` directory contains *tagsistant-support* command that is a command line interface to help using tagsistant.

### Install
To use this command, do following command
```bash
$ cd tagsistant-tools/commands
$ ./install-sh
```
Executing `./install.sh -s` instead of `./install.sh` is recommended if you want to generate extensions.

### Basic Usage

|**purpose**|**command**|
|---|---|
|mount directory|`tagsistant-support qmount ${HOME}/<path-to-destination>`|
|unmount directory|`tagsistant-support unmount <path-to-destination>`|
|make tags|`tagsistant-support mktag <tag1> <tag2> ...`|
|remove tags|`tagsistant-support rmtag <tag1> <tag2> ...`|
|rename tags|`tagsistant-support renametag <old-name> <new-name>`|
|merge tags|`tagsistant-support merge <destination-tag> <tag1> <tag2> ...`|
|move file from other filesystem|`tagsistant-support trans <file1> <file2> ... _ <tag1> <tag2> ...`|
|add tags to file|`tagsistant-support tag <file1> <file2> ... _ <tag1> <tag2> ...`|
|remove tags from file|`tagsistant-support untag <file1> <file2> ... _ <tag1> <tag2> ...`|
|remove file|`tagsistant-support rm <file1> <file2> ...`|
|rename file|`tagsistant-support rename <file1> <new-name>`|

Here is an example of tagsistant-support command usage.

```bash
# mount ~/tagsistant-test by using ~/.tagsistant-dir/tagsistant-test as the repository
$ tagsistant-support qmount ~/tagsistant-test
# move mounted directory
$ cd ~/tagsistant-test
# make tags in ~/tagsistant-test
$ tagsistant-support mktag tag1
# move .zshrc into ~/tagsistant-test and tag "zsh" and "config_file"
$ tagsistant-support trans ~/.zshrc _ zsh config_file
# rename file(.zshrc to zshrc.orig)
$ tagsistant-support rename store/zsh/@/.zshrc zshrc.orig
# unmount directory
$ cd 
$ tagsistant-support qmount ~/tagsistant-test
```

And [issue page](https://github.com/HiroakiMikami/tagsistant-tools/issues) contains the limitation of each command.

### extensions
If you want to add commands to `tagsistant-support`, you write a shell script in `${HOME}/.tagsistant-command.d`. The command name is the name of the shell script.

Here is an example of adding `test` command.
```bash
$ echo 'echo $1' > ~/.tagsistant-command.d/test
$ chmod u+x ~/.tagsistant-command.d/test
$ tagsistant-support test foo
foo
```
In zsh, `tagsistant-support` supports argument completion. You define `__tagsistant-support_<command-name>` function in `${HOME}/.tagsistant-command.d/<command-name>.completion` and `__tagsistant-support_<command-name>` function is used as a completion function. Examples are in [here](https://github.com/HiroakiMikami/tagsistant-tools/tree/master/command/.tagsistant-command.d).

## Future Directions
* integrate Firefox: I want to make Firefox addon to help for using tagsistant from Firefox.
* integrate Google Scholar: I want to use the information of Google Scholar(e.g. authors, title of paper and published year) for tagging.
* use tagsistant from tablet or smart phone.
