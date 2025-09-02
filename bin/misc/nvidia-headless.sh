# An attempt Nvidia without X or Desktop. See /usr/share/X11/xorg.conf.d/nvidia-drm-outputclass.conf , /etc/modprobe.d/nvidia* ,   /etc/modules-load.d/nvidia.conf
sudo apt install --no-install-recommends nvidia-smi nvidia-kernel-dkms linux-headers-amd64 libcuda1 nvidia-persistenced nvidia-cuda-dev nvidia-cuda-toolkit
