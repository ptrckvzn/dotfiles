#!/bin/bash

# Vagrant plugins
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-bindfs # required by ansible

# Script for placing sudoers.d files with syntax-checking
# https://www.vagrantup.com/docs/synced-folders/nfs.html

# Making a temporary file to contain the sudoers-changes to be pre-checked
TMP=$(mktemp -t vagrant_sudoers.XXXXXX)
cat > $TMP <<EOF
# vagrant-hostmanager
Cmnd_Alias VAGRANT_HOSTMANAGER_UPDATE = /bin/cp /Users/patrick/.vagrant.d/tmp/hosts.local /etc/hosts
%admin ALL=(root) NOPASSWD: VAGRANT_HOSTMANAGER_UPDATE
EOF

# Check if the changes we want are OK
visudo -c -f $TMP
if [ $? -eq 0 ]; then
  echo "Adding vagrant commands to sudoers"
  cat $TMP > /etc/sudoers.d/vagrant-sudoers
	chmod 0440 /etc/sudoers.d/vagrant-sudoers
else
  echo "sudoers syntax wasn't valid. Aborting!"
fi

rm -f $TMP
