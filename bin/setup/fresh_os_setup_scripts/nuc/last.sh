# ansible and timeshift
sudo apt install ansible-lint ansible dconf-editor python3-psutil dconf-cli python3-apt timeshift


# update the alternatives properly - check gcc and g++ versions

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++ 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 30

update-alternatives --query gcc
update-alternatives --query cc
update-alternatives --config gcc
update-alternatives --config cc
sudo update-alternatives --config gcc
sudo update-alternatives --config c99
sudo update-alternatives --config c89
sudo update-alternatives --config cp
sudo update-alternatives --config cpp
cpp
cpp -v
sudo apt install g++-11  gcc-11
sudo apt install g++-11  gcc-11-base
sudo update-alternatives --config cpp
sudo update-alternatives --config cc


sudo update-alternatives --display cc
sudo update-alternatives --display g++
sudo update-alternatives --display c++
sudo update-alternatives --display g++


sudo update-alternatives --config cmake
#1661895936
sudo update-alternatives --config make
