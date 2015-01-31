#! /bin/sh

mkdir -p ${HOME}/bin

if [ $1 = "-s" ]
then
    ln -s `pwd`/command/tagsistant-support ${HOME}/bin/tagsistant-support
    ln -s `pwd`/command/.tagsistant-command.d ${HOME}/
    sudo ln -s `pwd`/command/tagsistant-support_completion /usr/share/zsh/functions/Completion/Unix/_tagsistant-support
else
    cp `pwd`/command/tagsistant-support ${HOME}/bin/tagsistant-support
    cp `pwd`/command/.tagsistant-command.d ${HOME}/.tagsistant-command.d -r
    sudo cp `pwd`/command/tagsistant-support_completion /usr/share/zsh/functions/Completion/Unix/_tagsistant-support
fi
