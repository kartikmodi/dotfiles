sudo cp ../roles/root_user/files/distribution_packages/debian_sources_deb_org-testing.list /etc/apt/sources.list
sudo apt update
sudo apt -y install curl wget apt-transport-https dirmngr
sudo apt -y install dkms build-essential linux-headers-$(uname -r)
sudo apt -y install \
  dkms build-essential linux-headers-$(uname -r) linux-image-$(uname -r) \
sudo apt -y install \
  firmware-misc-nonfree intel-microcode \
  ansible-lint ansible dconf-editor python3-psutil dconf-cli python3-apt \
  intel-media-va-driver-non-free
