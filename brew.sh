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
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
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
brew install php72 --with-gmp --build-from-source

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install bramstein/webfonttools/woff2
brew install sfntly
brew install fontforge
brew install ttf2eot
brew install ttfautohint

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
# brew install lua
brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
brew install rename
# brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Python
# https://weknowinc.com/blog/running-multiple-python-versions-mac-osx
brew install pyenv
# brew install readline xz
# xcode-select --install
pyenv install 3.7.1
pyenv global 3.7.1

brew install hub
brew install pngquant
brew install webkit2png
brew install composer
brew install mariadb
brew install git-flow
brew install gettext
# brew install go
# brew install node
# brew install python
brew install ruby
brew install ngrep

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
brew cask install calibre
brew cask install dropbox
brew cask install firefox
brew cask install flash-player
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install handbrake
brew cask install hyper
brew cask install imageoptim
brew cask install java
brew cask install karabiner-elements
brew cask install onyx
brew cask install phantomjs
brew cask install poedit
brew cask install postman
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install screaming-frog-seo-spider
brew cask install sequel-pro
brew cask install sketch
brew cask install sketch-toolbox
brew cask install skype
brew cask install slack
brew cask install soulseek
brew cask install sourcetree
brew cask install spectacle
brew cask install spotifree
brew cask install spotify
brew cask install the-unarchiver
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
