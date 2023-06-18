#!/bin/bash
sudo apt install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit -y

sudo realm join -U ryan rdvm.local

sudo su -c 'echo "session optional  pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session'

sudo su -c 'echo "%sudo@rdvm.local ALL=(ALL:ALL) ALL" >> /etc/sudoers'