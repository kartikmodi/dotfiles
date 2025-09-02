#install nvidia drivers
#sudo apt install nvidia-detect
#nvidia-detect

sudo apt install -t bullseye-backports nvidia-driver nvidia-driver-libs:i386 nvidia-vdpau-driver:i386 nvidia-libopencl1 nvidia-libopencl1:i386 nvidia-vulkan-icd nvidia-vulkan-icd:i386  libnvoptix1

nvidia-vaapi-driver
nvidia-vaapi-driver:i386
nvidia-vaapi-driver nvidia-vaapi-driver:i386
# reboot mandated

lsmod # check modules

# sysctl entry only if vulkaninfo complains. see kde infocenter -> Graphics
sudo vim  /etc/sysctl.conf # --> dev.i915.perf_stream_paranoid=0
sudo sysctl dev.i915.perf_stream_paranoid=0 #runtime

# helper commands
xrandr --listproviders
glxinfo
glxgears
glxinfo | egrep -i 'renderer|vga|render|graphic|display'
intel_gpu_top
vulkaninfo
vainfo
rfkill
lshw
gnome-disk-utility
sudo    grep -ri nvidia /{etc,usr/share}/X11/*/*.conf* # search nvidia x11 conf

# Check logs
dmesg | egrep -i 'error|nvidia|intel|i915|iwlwifi'
sudo less /var/log/syslog
sudo less  kern.log
journalctl -b -1 # shows logs from previous boot
less /var/log/Xorg.0.log
