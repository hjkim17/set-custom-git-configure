#!/bin/bash

PARAM="e:";
OPT_E_FLAG=0;
while getopts $PARAM opt; do
  case $opt in
    e)
        echo "git config --global core.editor $OPTARG -n -w" >&2
        OPT_E=$OPTARG;
        git config --global core.editor "$OPT_E -n -w";
        OPT_E_FLAG=1;
        ;;
    *)
         ## default
         usage;
         exit 1;
         
  esac
done
if [ $OPT_E_FLAG == 0 ];then
	git config --global core.editor "subl -n -w"
	echo "git config --global core.editor subl -n -w" >&2
fi
# set commit template
cp "$(pwd)"/.gitmessage ~/.gitmessage
echo "cp $(pwd)/.gitmessage ~/.gitmessage" >&2
git config --global commit.template "~/.gitmessage"
echo "git config --global commit.template $(pwd)/.gitmessage" >&2