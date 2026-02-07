---
title: "Btrfs on a Hetzner Dedicated Server"
date: 2026-02-07T14:05:05-08:00
draft: false
---

This guide assumes you want to install Ubuntu 24.04, the server has a pair of NVME disks, and is set to boot using legacy mode. We also assume that the system has already been booted into the rescue system.

# Wipe Disks

Assuming the disks are NVME. We'll wipe the partition information from them, before proceeding.

```bash
wipefs -fa /dev/nvme*n1
```

# Install Ubuntu using `installimage`

Hetzner provides an operating system installation tool, `installimage`. We'll use this to partition, install the OS, and perform network configuration. The install configuration should look like the following:

```
#
# Hetzner Online GmbH - installimage
#
# This file contains the configuration used to install this
# system via installimage script. Comments have been removed.
#
# More information about the installimage script and
# automatic installations can be found in our wiki:
#
# https://docs.hetzner.com/robot/dedicated-server/operating-systems/installimage/
#

DRIVE1 /dev/nvme0n1
SWRAID 0
SWRAIDLEVEL 1
HOSTNAME fsn01
USE_KERNEL_MODE_SETTING no
PART btrfs.1    btrfs       all
SUBVOL btrfs.1  @           /
SUBVOL btrfs.1  @home       /home
IMAGE /root/.oldroot/nfs/install/../images/Ubuntu-2404-noble-amd64-base.tar.gz
```

# Add second disk

The `installimage` process doesn't support multiple disk btrfs configurations. So, we have to manually add the second disk, and install the bootloader.

## Copy partition tables

Assuming both disks are identical, we can simply copy the partition configuration from the first disk to the second.

```bash
sfdisk -d /dev/nvme0n1 | sfdisk --force /dev/nvme1n1
```

## Mount to /mnt

```bash
mount /dev/nvme0n1p1 /mnt
```

## Add nvme1n1p1

This will add the second disk to the file system. We need to use the force flag, so `btrfs` will ignore any file system signatures it finds.

```bash
btrfs device add -f /dev/nvme1n1p1 /mnt
```

## Convert to RAID1 (balance)

Currently all data and metadata is stored on the initial disk. The balance process will duplicate everything across both disks, and configure the file system to do this for any future data.

```bash
btrfs balance start -dconvert=raid1 -mconvert=raid1 /mnt
```

## Reboot into new system

```bash
reboot
```

## Install GRUB to both disks

The installer only puts the boot loader on the first disk. Installing the boot loader on to both disks will enable the system to boot, should either disk fail.

```bash
update-grub
grub-install /dev/nvme0n1
grub-install /dev/nvme1n1
```

## Install Hardware Enablement Stack

With btrfs constantly evolving, it's best to be using the latest supported kernels.

```bash
apt install --install-recommends linux-generic-hwe-24.04
```

## Install btrfsmaintenance

Ubuntu offers a package that perform automatic scrub, and other maintenance tasks. We'll configure it to perform automatic scrubs.

```bash
apt install btrfsmaintenance
systemctl enable btrfs-scrub.timer
```

# References

- [Installimage](https://docs.hetzner.com/robot/dedicated-server/operating-systems/installimage/)
- [Using The btrfs Filesystem (With RAID1) With Ubuntu 12.10 On A Hetzner Server](https://www.howtoforge.com/using-the-btrfs-filesystem-with-raid1-with-ubuntu-12.10-on-a-hetzner-server)
- [Ubuntu - btrfs](https://help.ubuntu.com/community/btrfs)
- [hetzner dedicated server with btrfs](https://ilayk.com/2021/02/05/hetzner-dedicated-server-btrfs)