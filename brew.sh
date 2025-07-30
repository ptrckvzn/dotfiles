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
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

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
# brew install exiv2
brew install gh
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
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
brew install pngquant
brew install webkit2png
brew install composer
brew install mariadb
brew install git-flow
brew install gettext
brew install ruby
brew install ngrep
brew install pyenv
brew install tmux

# fzf - fuzzy finder
brew install fzf
$(brew --prefix fzf)/install --key-bindings --completion --no-update-rc --no-fish --no-zsh

# fz - https://github.com/changyuheng/fz
[ ! -d ~/.bash_completion.d ] && mkdir ~/.bash_completion.d
curl "https://raw.githubusercontent.com/rupa/z/master/{z.sh}" \
    -o ~/.bash_completion.d/"#1"
curl "https://raw.githubusercontent.com/changyuheng/fz/master/{fz.sh}" \
    -o ~/.bash_completion.d/z"#1"

# Music
brew install flac
brew install lame
# brew install --cask dexed
# brew install --cask musicbrainz-picard

# Cloud providers
# brew install aws-elasticbeanstalk
# brew install awscli
# brew install azure-cli

brew install --cask adobe-acrobat-reader
brew install --cask adobe-digital-editions
brew install --cask calibre
# brew install --cask discord
brew install --cask figma
brew install --cask firefox-developer-edition
brew install --cask github
brew install --cask google-chrome
# brew install --cask handbrake
brew install --cask imageoptim
brew install --cask jetbrains-toolbox
# brew install --cask keka
brew install --cask nordvpn
brew install --cask orbstack
brew install --cask plex
brew install --cask postman
brew install --cask raycast
brew install --cask slack
brew install --cask soulseek
brew install --cask spotify
brew install --cask sysex-librarian
brew install --cask transmission
brew install --cask visual-studio-code
brew install --cask vlc

# Remove outdated versions from the cellar.
brew cleanup
