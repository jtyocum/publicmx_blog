---
title: "Splitting Production From Dev"
date: 2026-01-24T09:53:29-08:00
draft: false
---

When I moved to self-hosting everything, my production and development environments were merged. My on-prem hosting capacity is limited, and even more so now that component pricing has gone insane. I have opted to migrate my production services that aren't located behind a VPN to a dedicated server with [Hetzner](https://www.hetzner.com/). This has also given me an opportunity to play with new configurations like security options and file systems. For example, I have gone with [btrfs](https://docs.kernel.org/filesystems/btrfs.html) in a RAID1 configuration. Over time, I plan to share more about how that deployment was done, and any lessons learned afterward.
