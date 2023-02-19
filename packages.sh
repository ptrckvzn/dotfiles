#!/usr/bin/env bash

# Composer
composer global require squizlabs/PHP_CodeSniffer
composer global require friendsofphp/php-cs-fixer

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
nvm install 18
nvm alias default 18
nvm list

# npm
npm install -g eslint
npm install -g prettier
npm install -g yarn

# fz - https://github.com/changyuheng/fz
[ ! -d ~/.bash_completion.d ] && mkdir ~/.bash_completion.d
curl "https://raw.githubusercontent.com/changyuheng/fz/master/{fz.sh}" -o ~/.bash_completion.d/z"#1"
