#!/bin/bash
nodeJs="/usr/bin/node"
if [ -e "$nodeJs" ]
then
	  echo ${nodeJs}
else
	 curl -sL install-node.vercel.app/lts | bash
fi

## download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp vimrc ~/.vimrc

mkdir -p ~/.vim/plugged
cd ~/.vim/plugged

git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1


#安装扩展
mkdir -p ~ /.config/coc/extensions
cd  ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo ' {"dependencies":{
  	  "coc-clangd": ">=0.18.2",
      "coc-emmet": ">=1.1.6",
      "coc-explorer": ">=0.20.2",
      "coc-go": ">=1.1.0",
      "coc-godot": ">=0.0.1",
      "coc-html": ">=1.5.1",
      "coc-jedi": ">=0.30.1",
      "coc-json": ">=1.4.0",
      "coc-lua": ">=1.0.1",
      "coc-marketplace": ">=1.8.1",
      "coc-python": ">=1.2.13",
      "coc-sh": ">=0.6.1",
      "coc-translator": ">=1.7.1",
      "coc-vimlsp": ">=0.12.5"}} ' > package.json
fi 
npm install coc-snippets --global-style --ignore-scripts --no -bin-links --no-package-lock --only=prod

