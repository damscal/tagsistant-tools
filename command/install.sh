#! /bin/sh

mkdir -p ${HOME}/bin

if [ $1 = "-s" ]
then
    ln -s `pwd`/tagsistant-support ${HOME}/bin/tagsistant-support
    ln -s `pwd`/.tagsistant-command.d ${HOME}/
    sudo ln -s `pwd`/command/tagsistant-support_completion /usr/share/zsh/functions/Completion/Unix/_tagsistant-support
else
    cp `pwd`/tagsistant-support ${HOME}/bin/tagsistant-support
    cp `pwd`/.tagsistant-command.d ${HOME}/.tagsistant-command.d -r
    sudo cp `pwd`/tagsistant-support_completion /usr/share/zsh/functions/Completion/Unix/_tagsistant-support
fi
