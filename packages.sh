#!/usr/bin/env bash

# Python
pip install ansible

# Composer
composer global require laravel/valet
composer global require squizlabs/PHP_CodeSniffer
composer global require friendsofphp/php-cs-fixer

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# NPM
# nvm install 8
nvm install 12
nvm use 12

npm install -g create-next-app
npm install -g create-react-app
npm install -g eslint
npm install -g gatsby-cli
# npm install -g pa11y
# npm install -g pageres
npm install -g prettier
npm install -g react-devtools
# npm install -g tlapse
npm install -g webpack

# Vagrant plugins
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-bindfs # required by ansible

# WP-CLI
# wp package install aaemnnosttv/wp-cli-valet-command
# wp package install git@github.com:alwaysblank/blade-generate.git

# Automatically exclude development dependencies from Apple Time Machine backups
# https://github.com/stevegrunwell/asimov
# cd ~
# git clone https://github.com/stevegrunwell/asimov
# cd asimov && ./install.sh

# fz - https://github.com/changyuheng/fz
[ ! -d ~/.bash_completion.d ] && mkdir ~/.bash_completion.d
curl "https://raw.githubusercontent.com/changyuheng/fz/master/{fz.sh}" -o ~/.bash_completion.d/z"#1"
