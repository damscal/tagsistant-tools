#! /bin/sh

mkdir -p ${HOME}/bin

if [ $1 = "-s" ]
then
    ln -s `pwd`/tagsistant-tools ${HOME}/bin/tagsistant-tools
    ln -s `pwd`/.tagsistant-command.d ${HOME}/
    sudo ln -s `pwd`/command/tagsistant-tools_completion /usr/share/zsh/functions/Completion/Unix/_tagsistant-tools
else
    cp `pwd`/tagsistant-tools ${HOME}/bin/tagsistant-tools
    cp `pwd`/.tagsistant-command.d ${HOME}/.tagsistant-command.d -r
    sudo cp `pwd`/tagsistant-tools_completion /usr/share/zsh/functions/Completion/Unix/_tagsistant-tools
fi
