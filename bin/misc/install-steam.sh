# Install manually because of agreement to license
# Refer https://wiki.debian.org/Steam
# Refer https://unix.stackexchange.com/questions/264004/installing-steam-on-debian
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steam
sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386 libglx-mesa0:i386  libgl1-mesa-dri:i386
sudo apt install steam:i386

# Removed after installing libgl1-mesa-glx:i386 # This is a transitional dummy package, it can be safely removed.










