#!/usr/bin/env bash
################################################################################
#                     Install and Configure the on-my-zsh                      #
################################################################################


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

function change_login_shell() {
  #echo "Make zsh the valid login shell.";
  #echo "$(which zsh)" >> /etc/shells;
  #[[ $? == 0 ]] && echo "Make zsh the valid login shell done.";
  #[[ $? == 0 ]] || echo "Make zsh the valid login shell failed.";

  [[ -z $(which chsh) ]] || chsh -s $(which zsh);
  [[ $? == 0 ]] && echo "Change login shell done.";
  [[ $? == 0 ]] || echo "Change login shell failed.";
}

# Already track ohmyzsh using git submodule.
#check_prerequsites
#if [[ ($? == 0) ]]; then
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#fi

if [[ ! -z $(which zsh) ]]; then
  echo "zsh found"
  echo "Change the default login shell: START"
  change_login_shell;
  echo "Change the default login shell: END"
fi

if [[ -d ${HOME}/.oh-my-zsh/ ]]; then
  echo "Install zsh autosuggestions plugin"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
