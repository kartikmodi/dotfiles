# Dependencies to install packages with aptd
# Debian Document Link - https://wiki.debian.org/InstallingDebianOn/Apple/MacBookAir/6-2
# https://wiki.debian.org/wl for BCM4360 in air
# Enable backports to install

# The below command is supposed to be installed. Just type the right uname -r as per kernel wanting to run
#sudo apt -y install \
# dkms build-essential linux-headers-$(uname -r) linux-image-$(uname -r)\
# broadcom-sta-dkms
# broadcom line -> actual wifi drivers
# Using uname -r will give exact kernel package version. Stick to this

# This should some warning of firmware missing possible missing firmware /lib/firmware/i915/ for module i915
# https://unix.stackexchange.com/questions/556946/possible-missing-firmware-lib-firmware-i915-for-module-i915
sudo apt -y install \
  firmware-misc-nonfree intel-microcode \
  ansible-lint ansible dconf-editor python3-psutil dconf-cli python3-apt \
  intel-media-va-driver-non-free
# firmware packages linux. Do not install as it installs packages which are not required for MBA

# Restart the machine with Wifi Working now

#TODO ansible-doc is not available in testing debian for some reason so need to manually download and install sid version


# One time config changes but wont persist for keyboard layout and mapping on MBA
#echo 1|sudo tee /sys/module/hid_apple/parameters/swap_opt_cmd
#echo 1|sudo tee /sys/module/hid_apple/parameters/swap_fn_leftctrl
#echo 2|sudo tee /sys/module/hid_apple/parameters/fnmode

#https://unix.stackexchange.com/questions/121395/on-an-apple-keyboard-under-linux-how-do-i-make-the-function-keys-work-without-t
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
echo options hid_apple swap_opt_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
echo options hid_apple swap_fn_leftctrl=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all


# Webcam installation Guide
# Part - 1
git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware/
make
sudo make install

# Part 2
sudo apt-get install linux-headers-5.10.0-8-amd64 git kmod libssl-dev checkinstall
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make
sudo make install
sudo depmod
sudo modprobe facetimehd

# Loading module at boot time
echo facetimehd | sudo tee /etc/modules-load.d/facetimehd.conf




