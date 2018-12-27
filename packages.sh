#!/usr/bin/env bash

# Python
pip install ansible

# Gems
gem install bitters

# Composer
composer global require laravel/valet
composer global require squizlabs/PHP_CodeSniffer
composer global require friendsofphp/php-cs-fixer

# NPM
npm install -g yarn@latest
npm install -g create-next-app
npm install -g create-react-app
npm install -g create-react-native-app
npm install -g eslint
npm install -g gatsby-cli
npm install -g pa11y
npm install -g pageres
npm install -g prettier
npm install -g react-devtools
npm install -g tlapse
npm install -g webpack

# Vagrant plugins
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-bindfs # required by ansible

# WP-CLI
# wp package install wp-cli/restful
# wp package install aaemnnosttv/wp-cli-valet-command
wp package install git@github.com:alwaysblank/blade-generate.git

# Automatically exclude development dependencies from Apple Time Machine backups
# https://github.com/stevegrunwell/asimov
# cd ~
# git clone https://github.com/stevegrunwell/asimov
# cd asimov && ./install.sh
