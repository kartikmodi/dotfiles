DEFAULT_USER=workstation
su <<!
{youpasswordhere}
sed -i '/sudo\tALL=(ALL:ALL)/c\%sudo\tALL=(ALL:ALL) NOPASSWD:ALL' /etc/sudoers
/sbin/usermod -aG sudo $DEFAULT_USER
!

# need a reboot after this
# systemctl reboot
