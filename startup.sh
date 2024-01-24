#!/bin/sh

pushd $HOME

ln -sf .dotfiles/cargo .cargo
ln -sf .dotfiles/config .config
ln -sf .dotfiles/gitconfig .gitconfig
ln -sf .dotfiles/local .local
ln -sf .dotfiles/tmux .tmux
ln -sf .dotfiles/tmux.conf .tmux.conf
ln -sf .dotfiles/tmux.conf.local .tmux.conf.local
ln -sf .dotfiles/vim .vim
ln -sf .dotfiles/zshrc .zshrc

popd
