#! /usr/bin/bash

curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt install exuberant-ctags -y
sudo apt install clangd -y 
mv ../vim-config ../.vim

