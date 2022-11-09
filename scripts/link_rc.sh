#! /usr/bin/env bash

# make sure you execute this script at the current directory.

CONFIG_FILE_PATH=${PWD}/.. # Path of original dotfiles.

[ -f ${CONFIG_FILE_PATH}/.vimrc ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.vimrc ${HOME}/.vimrc

[ -d ${CONFIG_FILE_PATH}/.vim/ ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.vim/ ${HOME}/

[ -f ${CONFIG_FILE_PATH}/.gitconfig ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.gitconfig ${HOME}/.gitconfig

[ -f ${CONFIG_FILE_PATH}/.bashrc ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.bashrc ${HOME}/.bashrc

[ -f ${CONFIG_FILE_PATH}/.zshrc ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.zshrc ${HOME}/.zshrc

[ -d ${CONFIG_FILE_PATH}/.config/ ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.config/* ${HOME}/.config/

[ -f ${CONFIG_FILE_PATH}/.tmux.conf ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.tmux.conf ${HOME}/.tmux.conf

[ -d ${CONFIG_FILE_PATH}/.oh-my-zsh/ ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.oh-my-zsh/ ${HOME}/

[ -f ${CONFIG_FILE_PATH}/.latexmkrc ] \
    && ln -fsv ${CONFIG_FILE_PATH}/.latexmkrc ${HOME}/.latexmkrc

