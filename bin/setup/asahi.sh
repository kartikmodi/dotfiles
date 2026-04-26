sudo grubby --update-kernel=ALL --args="hid_apple.swap_fn_leftctrl=1"
sudo grubby --update-kernel=ALL --args="hid_apple.swap_opt_cmd=1"
sudo grubby --update-kernel=ALL --args="hid_apple.fnmode=2"
sudo dnf upgrade --refresh --best --allowerasing 2>&1 | tee ~/dnf-upgrade.log

#  Restart

nix profile install github:nix-community/home-manager/release-25.11#home-manager

# brave install
sudo dnf install dnf-plugins-core

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo dnf install brave-browser

sudo dnf install ansible git snapper vim python3-dnf-plugin-snapper.noarch btrfs-assistant

sudo snapper -c root create-config /
sudo snapper -c home create-config /home


sudo systemctl enable --now snapper-cleanup.timer
sudo systemctl enable --now snapper-timeline.timer
sudo snapper -c root list

sudo snapper -c home list
sudo snapper -c root create --description "{enter description here}"
sudo snapper -c home create --description "{enter description here}"

sudo systemctl enable --now snapper-timeline.timer
sudo systemctl enable --now snapper-cleanup.timer
sudo systemctl status snapper-cleanup.timer
sudo systemctl status snapper-timeline.timer

sudo btrfs subvolume list /home
sudo btrfs subvolume list

ls
sudo snapper list
sudo snapper -c home list
sudo snapper -c root create -d "Fresh install. Root snapshot after first dnf upgrade"
sudo snapper -c root list
sudo snapper -c home create -d "Fresh Install. Home snapshot after firefox extensions installed"
sudo snapper -c root list
sudo snapper -c home list

# Determinate Nix
curl -fsSL https://install.determinate.systems/nix | sh -s -- install

sudo widevine-installer

sudo titdb -d /dev/input/event0
