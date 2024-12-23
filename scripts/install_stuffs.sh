#! /usr/bin/env bash


#######################
#  brew installation  #
#######################

# You can change the source of brew.
# See http://t.zoukankan.com/iAmSoScArEd-p-12394625.html

# fd: a simple, fast and user-friendly alternative to find.
TOOLS=(cmake python nvim tmux pandoc pandoc-crossref lazygit zsh tree node ranger \
       fzf fd gawk todo-txt xclip ripgrep)

if [[ $(which brew) ]]; then
  brew update
  for tool in "${TOOLS[@]}"; do
    brew install $tool
  done

  if [[ ! -z ${INSTALL_BIG_SIZE} ]]; then
    brew install texlive
  fi
else
  echo "brew not found! Please install."
fi


######################
#  pip installation  #
######################

pip3 install pynvim --upgrade # for nvim to work.
pip3 install virtualenvwrapper

# In the virtual environment, run the following command:
# pip3 install conan
