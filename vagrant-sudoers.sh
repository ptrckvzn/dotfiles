#!/bin/bash
# Script for placing sudoers.d files with syntax-checking
# https://www.vagrantup.com/docs/synced-folders/nfs.html

# Making a temporary file to contain the sudoers-changes to be pre-checked
TMP=$(mktemp -t vagrant_sudoers)
# cat /etc/sudoers/ > $TMP
cat > $TMP <<EOF
# Allow passwordless startup of Vagrant when using NFS.
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/local/bin/sed -E -e /*/ d -ibak /etc/exports
%admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE

# Allow passwordless startup of Vagrant with vagrant-hostsupdater.
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin ALL=(root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE

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
