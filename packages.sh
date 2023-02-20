#!/usr/bin/env bash

# Composer
composer global require squizlabs/PHP_CodeSniffer
composer global require friendsofphp/php-cs-fixer

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 18
nvm alias default 18
nvm use default
nvm list

# npm
npm install -g eslint
npm install -g prettier
npm install -g yarn
