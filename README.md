Fork to package [tagsistant-tools](https://github.com/HiroakiMikami/tagsistant-tools) in nix with flakes.

# tagsistant-tools
Tools for using [tagsistant](http://www.tagsistant.net/)

## commands
`commands` directory contains *tagsistant-tools* command that is a command line interface to help using tagsistant.

### Install


### Basic Usage

|**purpose**|**command**|
|---|---|
|mount directory|`tagsistant-tools qmount ${HOME}/<path-to-destination>`|
|unmount directory|`tagsistant-tools unmount <path-to-destination>`|
|make tags|`tagsistant-tools mktag <tag1> <tag2> ...`|
|remove tags|`tagsistant-tools rmtag <tag1> <tag2> ...`|
|rename tags|`tagsistant-tools renametag <old-name> <new-name>`|
|merge tags|`tagsistant-tools merge <destination-tag> <tag1> <tag2> ...`|
|move file from other filesystem|`tagsistant-tools trans <file1> <file2> ... _ <tag1> <tag2> ...`|
|add tags to file|`tagsistant-tools tag <file1> <file2> ... _ <tag1> <tag2> ...`|
|remove tags from file|`tagsistant-tools untag <file1> <file2> ... _ <tag1> <tag2> ...`|
|remove file|`tagsistant-tools rm <file1> <file2> ...`|
|rename file|`tagsistant-tools rename <file1> <new-name>`|

Here is an example of tagsistant-tools command usage.

```bash
# mount ~/tagsistant-test by using ~/.tagsistant-dir/tagsistant-test as the repository
$ tagsistant-tools qmount ~/tagsistant-test
# move mounted directory
$ cd ~/tagsistant-test
# make tags in ~/tagsistant-test
$ tagsistant-tools mktag tag1
# move .zshrc into ~/tagsistant-test and tag "zsh" and "config_file"
$ tagsistant-tools trans ~/.zshrc _ zsh config_file
# rename file(.zshrc to zshrc.orig)
$ tagsistant-tools rename store/zsh/@/.zshrc zshrc.orig
# unmount directory
$ cd 
$ tagsistant-tools qmount ~/tagsistant-test
```

And [issue page](https://github.com/HiroakiMikami/tagsistant-tools/issues) contains the limitation of each command.

### extensions
If you want to add commands to `tagsistant-tools`, you write a shell script in `${HOME}/.tagsistant-command.d`. The command name is the name of the shell script.

Here is an example of adding `test` command.
```bash
$ echo 'echo $1' > ~/.tagsistant-command.d/test
$ chmod u+x ~/.tagsistant-command.d/test
$ tagsistant-tools test foo
foo
```
In zsh, `tagsistant-tools` supports argument completion. You define `__tagsistant-tools_<command-name>` function in `${HOME}/.tagsistant-command.d/<command-name>.completion` and `__tagsistant-tools_<command-name>` function is used as a completion function. Examples are in [here](https://github.com/HiroakiMikami/tagsistant-tools/tree/master/command/.tagsistant-command.d).

## Future Directions
* integrate Firefox: I want to make Firefox addon to help for using tagsistant from Firefox.
* integrate Google Scholar: I want to use the information of Google Scholar(e.g. authors, title of paper and published year) for tagging.
* use tagsistant from tablet or smart phone.
