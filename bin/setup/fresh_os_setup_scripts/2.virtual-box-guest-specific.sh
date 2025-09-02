sudo apt -y install curl wget apt-transport-https dirmngr
sudo apt -y install dkms build-essential linux-headers-$(uname -r)
sudo apt -y install \
  dkms build-essential linux-headers-$(uname -r) linux-image-$(uname -r) \
sudo apt -y install \
  firmware-misc-nonfree intel-microcode \
  ansible-lint ansible dconf-editor python3-psutil dconf-cli python3-apt \
  intel-media-va-driver-non-free

# Mount the iso of vbox guest additions now

# sudo mount /dev/cdrom /mnt/guestadditions if required
sudo sh ./VBoxLinuxAdditions.run

# lsmod | grep vboxguest # to check and confirm


# Virtual Box Automount as root problem
#https://askubuntu.com/questions/481559/how-to-automatically-mount-a-folder-and-change-ownership-from-root-in-virtualbox
sudo usermod -G vboxsf -a myusername
#https://superuser.com/questions/640027/why-cant-i-chown-a-virtualbox-shared-folder