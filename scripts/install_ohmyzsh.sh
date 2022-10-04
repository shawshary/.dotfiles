#!/usr/bin/env bash
# Install oh-my-zsh

#############################
#  Check the prerequisites  #
#############################


function check_prerequsites() {
  # TODO: use loop

  if [ -z $(which zsh) ]; then
    echo "error: zsh not found" >&2;
    exit 1;
  fi

  if [ -z $(which git) ]; then
    echo "error: git not found" >&2;
    exit 1;
  fi

  if [ -z $(which curl) ]; then
    echo "error: curl not found" >&2;
    exit 1;
  fi

  echo "Prequisites check passed.";
  return 0;
}

check_prerequsites
if [[ $? == 0 ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

