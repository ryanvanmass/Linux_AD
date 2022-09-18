#!/bin/bash
sudo apt install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit -y

sudo realm join -U ryan $1

sudo ehco "session optional  pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session