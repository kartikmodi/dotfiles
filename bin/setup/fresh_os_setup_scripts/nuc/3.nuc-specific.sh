# Dependencies to install packages with apt
sudo apt install curl wget apt-transport-https dirmngr

# existing kernel
sudo apt install build-essential

# restart mandate
# dep for liquorix
sudo apt install libelf-dev/bullseye-backports dkms/bullseye-backports

# custom kernel - liquorix # dont u
curl 'https://liquorix.net/add-liquorix-repo.sh' > kernel_custom.sh #dont install latest. Use 517 if 519 is latest
sudo apt-get install -y linux-image-liquorix-amd64 linux-headers-liquorix-amd64
# reboot mandated

# just ensures right version
sudo apt install linux-headers-$(uname -r) linux-image-$(uname -r)

#sudo apt install iwlwifi # dont install, wifi and bluetooth did worked without this installed

# reboot recommended



# mesa-utils-bin from testing
# reboot mandated