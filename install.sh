#! /usr/bin/bash

curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt install clangd
mv ../vim-config ../.vim

