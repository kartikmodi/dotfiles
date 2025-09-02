sudo cp ../roles/root_user/files/distribution_packages/debian_sources_deb_org-testing.list /etc/apt/sources.list
sudo apt update
sudo apt -y install curl wget apt-transport-https dirmngr
sudo apt -y full-upgrade

# To check if any package config is left over
# sudo dpkg --configure -a
