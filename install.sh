#! /bin/sh

mkdir -p ${HOME}/bin

if [ $1 = "-s" ]
then
    ln -s `pwd`/command/tagsistant-support ${HOME}/bin/tagsistant-support
    ln -s `pwd`/command/.tagsistant-command.d ${HOME}/.tagsistant-command.d
else
    cp `pwd`/command/tagsistant-support ${HOME}/bin/tagsistant-support
    cp `pwd`/command/.tagsistant-command.d ${HOME}/.tagsistant-command.d -r
fi
