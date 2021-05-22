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
brew install gnu-sed
# Install a modern version of Bash
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
# brew install openssh
brew install screen
brew install rsync
brew install php
brew install gmp
brew install bzip2
brew install readline
brew install zlib

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
brew install java
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
brew install http-server
brew install hub
brew install pngquant
brew install webkit2png
brew install composer
brew install mariadb
brew install git-flow
brew install gettext
brew install ruby
brew install ngrep
brew install pyenv

# fzf - fuzzy finder
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-fish --no-zsh

# Music
brew install flac
brew install lame

# WordPress
brew install wp-cli

# Hombrew Cask
brew tap homebrew/cask

# brew install --cask amethyst
brew install --cask adobe-digital-editions
brew install --cask dropbox
brew install --cask figma
brew install --cask homebrew/cask-versions/firefox-developer-edition
brew install --cask flash-player
brew install --cask google-backup-and-sync
brew install --cask google-chrome
brew install --cask handbrake
brew install --cask harvest
brew install --cask hyper
brew install --cask imageoptim
brew install --cask kap
brew install --cask karabiner-elements
brew install --cask keka
# brew install --cask min
# brew install --cask musicbrainz-picard
brew install --cask onyx
brew install --cask oryoki
# brew install --cask phpstorm
brew install --cask plex-media-player
brew install --cask poedit
brew install --cask postman
brew install --cask qlcolorcode
brew install --cask qlmarkdown
brew install --cask qlstephen
brew install --cask quicklook-json
brew install --cask qlImageSize
brew install --cask rectangle
brew install --cask sequel-pro
brew install --cask skype
brew install --cask slack
# brew install --cask soulseek
brew install --cask sourcetree
brew install --cask transmission
brew install --cask vagrant
brew install --cask vagrant-manager
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask visual-studio-code
brew install --cask vlc

# Completions
brew install vagrant-completion

# Remove outdated versions from the cellar.
brew cleanup
