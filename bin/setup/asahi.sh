sudo grubby --update-kernel=ALL --args="hid_apple.swap_fn_leftctrl=1"
sudo grubby --update-kernel=ALL --args="hid_apple.swap_opt_cmd=1"
sudo grubby --update-kernel=ALL --args="hid_apple.fnmode=2"

# Determinate Nix
curl -fsSL https://install.determinate.systems/nix | sh -s -- install

nix profile install github:nix-community/home-manager/release-25.11#home-manager

sudo dnf install ansible git snapper

sudo systemctl enable --now snapper-cleanup.timer
sudo systemctl enable --now snapper-timeline.timer
sudo snapper -c root create --description "{enter description here}"

sudo widevine-installer

sudo  titdb -d /dev/input/event0