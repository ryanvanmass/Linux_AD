#!/bin/bash
# Link to Guide: https://techcommunity.microsoft.com/discussions/windowsserverinsiders/problems-to-join-debianubuntu-machines-to-a-domain/4158051/replies/4277301
# Install Dependancies
sudo apt install sssd-ad sssd-tools realmd adcli krb5-user samba-common-bin adsys oddjob oddjob-mkhomedir ca-certificates -y




# Join Server to Domain
sudo realm join --membership-software=samba -U ryan rdvm.local

# sudo su -c 'echo "session optional  pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session'

sudo su -c 'echo "%sudo@rdvm.local ALL=(ALL:ALL) ALL" >> /etc/sudoers'

# Import SSH key to primary server admin account
su ryan@rdvm.local -c "ssh-import-id-gh ryanvanmass"
