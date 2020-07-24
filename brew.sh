#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
# brew install openssh
brew install screen
brew install rsync
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install bramstein/webfonttools/woff2
brew install sfntly
brew install fontforge
brew install ttf2eot
brew install ttfautohint

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
brew install rename
# brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install z
brew install zopfli
brew install hub
brew install pngquant
brew install webkit2png
brew install composer
brew install mariadb
brew install git-flow
brew install gettext
brew install ruby
brew install ngrep

xcode-select --install

# Python
# https://weknowinc.com/blog/running-multiple-python-versions-mac-osx
brew install pyenv
# brew install readline xz
pyenv install 2.7.17
pyenv install 3.8.0
pyenv global 2.7.17

# Node
brew install nvm

# fzf - fuzzy finder
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-fish --no-zsh

# Music
brew install flac
brew install lame

# WordPress
brew install wp-cli

# Hombrew Cask
brew tap caskroom/cask

# brew cask install amethyst
brew cask install adobe-digital-editions
brew cask install dropbox
brew cask install figma
brew cask install homebrew/cask-versions/firefox-developer-edition
brew cask install flash-player
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install handbrake
brew cask install harvest
brew cask install hyper
brew cask install imageoptim
brew cask install java
brew cask install kap # video capture
brew cask install karabiner-elements
brew cask install keka
# brew cask install min
# brew cask install musicbrainz-picard
# brew cask install onyx
brew cask install oryoki
# brew cask install phpstorm
brew cask install plex-media-player
brew cask install poedit
brew cask install postman
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install rectangle
brew cask install sequel-pro
brew cask install sketch
brew cask install sketch-toolbox
brew cask install skype
brew cask install slack
brew cask install soulseek
brew cask install sourcetree
brew cask install transmission
brew cask install unrarx
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cask install vlc

# Completions
brew install vagrant-completion

# Remove outdated versions from the cellar.
brew cleanup
