#! /usr/bin/env bash

#######################
#  brew installation  #
#######################

# You can change the source of brew.
# See http://t.zoukankan.com/iAmSoScArEd-p-12394625.html

brew install linux-headers@5.15

brew install python@3.10 # need to remove the '--with-lto' flag.

#brew install -s vim # need to configure 'with-features=huge, --with-x'

brew install nvim

brew install tmux

brew install pandoc pandoc-crossref

brew install lazygit

brew install zsh

brew install tree

brew install node

brew install ranger

brew install fzf

if [[ ! -z ${INSTALL_BIG_SIZE} ]]; then
    brew install texlive
fi


######################
#  pip installation  #
######################

pip3 install pynvim --upgrade # for nvim to work.


