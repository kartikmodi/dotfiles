sudo cp ../roles/root_user/files/distribution_packages/debian_sources_deb_org-buster.list /etc/apt/sources.list
sudo apt update
# Dependencies to install packages with apt
sudo apt -y install curl wget apt-transport-https dirmngr
# Debian Document Link - https://wiki.debian.org/InstallingDebianOn/Apple/MacBookAir/6-2
# https://wiki.debian.org/wl for BCM4360 in air
# Enable backports to install

sudo apt -y install \
  dkms build-essential linux-headers-$(uname -r) linux-image-$(uname -r) \
  broadcom-sta-dkms broadcom-sta-source broadcom-sta-common wireless-tools
# broadcom line -> actual wifi drivers
# Using uname -r will give exact kernel package version. Stick to this

# Restart the machine with Wifi Working now
