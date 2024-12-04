#!/bin/bash
# Install Dependancies
sudo apt install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit -y

# Fix DNS to recognize Active Directory controlled DNS
# sudo rm -f /etc/resolv.conf
# sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Join Server to Domain
sudo realm join -U ryan rdvm.local

sudo su -c 'echo "session optional  pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session'

sudo su -c 'echo "%sudo@rdvm.local ALL=(ALL:ALL) ALL" >> /etc/sudoers'

# Import SSH key to primary server admin account
su ryan@rdvm.local -c "ssh-import-id-gh ryanvanmass"
