# https://wiki.debian.org/Swap
sudo dd if=/dev/zero of=/swapfile1 bs=1M count=16384 status=progress
sudo ls -l /swapfile1
sudo chmod 600 /swapfile1
sudo mkswap /swapfile1
sudo swapon --priority 10 /swapfile1
sudo swapon --show

# https://wiki.archlinux.org/title/swap
# fstab entry
echo '# Swap file created on 9/11/2021' | sudo tee -a /etc/fstab
echo '/swapfile1 none swap defaults,pri=10 0 0' | sudo tee -a /etc/fstab
sudo blkid
sudo lsblk

# NOTE Don't enabled zram and zswap simultaneously
