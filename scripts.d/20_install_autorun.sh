#!/bin/bash

source lib.sh

cat << EOF > /etc/systemd/system/autorun.service
[Unit]
Description=run autorun(once)(.sh) scripts from USB stick or in /boot
After=local_fs.target remote_fs.target network-online.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/bin/do_autorun start
Restart=no

[Install]
WantedBy=multi-user.target

EOF

_op _chroot ln -s /etc/systemd/system/autorun.service /etc/systemd/system/multi-user.target/autorun.service