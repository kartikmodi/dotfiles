# Re-install macos
1. Booting into Recovery
Press and hold and power key from shutdown, to enter startup options, and select Options

2. Select Disk Utility, Command+2 to show all devices, erase disks, then delete vols, and make single `macosvol` partition of 8TB. Format everything to `apfs` if there are `Unknown` fs. This allows to collate them. Do this until everything grows back to `Container diskX`.

3. Back to recovery home, and click re-install and select `macosvol` to begin installation.


# Paritions
Partitions cannot be created before installing fresh macos. Macos errors out in boot process, quoting `manually formatted drive` and locks the user out. 

Create 1 volume only in each partition for more separation (less flexibility). After macos install, open Disk utility - 

Partition - 
    6TB apfs `shared` 
    250G exfat `cross` - Use TB unit to get accuracy
This should leave `macosvol` to 1.75TB

# Installing asahi
Shrink `shared` to 500G, this will create 5.5TB of free space. 
Enter `asahivol` as Os name, and claim 1.5TB of space. 
and leave Unallocated space of 4TB.

# Post asahi install
1. Update KDE Partition Manager
2. Make remaining partitions of 4TB space, one by one
    3TB of luks2 btrfs `esync`
    ~350G of ext4 `io`
    remaining ~300G of NTFS `vm`c


