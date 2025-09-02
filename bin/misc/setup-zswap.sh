# https://medium.com/for-linux-users/linux-tip-higher-performance-with-zswap-2a4654b935de

# List all zswap params
grep . /sys/module/zswap/parameters/*


# Enaable zswap temporary
echo Y | sudo tee /sys/module/zswap/parameters/enabled
# tune zswap temporary

# Edit /etc/rc.local to run on boot
echo Y >/sys/module/zswap/parameters/enabled