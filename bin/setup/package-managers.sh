#Install nix on debian system wide for all users
sudo apt install nix-bin nix-setup-systemd

#Enable Flakes
echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf

# Install home-manager
nix profile install github:nix-community/home-manager

# If error: getting status of /nix/var/nix/daemon-socket/socket: Permission denied in above command 
sudo usermod -aG nix-users workstation # This might be avoided with authorized users in /etc/nix/nix.conf
#then relogin and try again

#Install flatpak to install IDE, and basic stuff
sudo apt install flatpak ansible

# run after installing flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo