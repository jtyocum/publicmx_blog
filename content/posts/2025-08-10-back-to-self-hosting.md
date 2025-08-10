---
title: "Back to Self Hosting"
date: 2025-08-10T10:04:20-07:00
draft: false
---

For a long time, I have relied on VPS or VM hosting services to host my sites and applications. While that could be considered self hosting, as I managed the VPS myself, it's not fully self hosting. Recently, I picked up a mini PC, with an Intel N150 CPU. Installed Proxmox, created VMs, etc. Just like before, I'm still using Ansible for system configuration. To handle the multiple web applications, and a desire to avoid custom ports, I am using Cloudflare's tunnel service. This makes it easy to map hostnames to my services, avoid the need for dynamic DNS, and no need for port forwarding. As for what the future holds, perhaps I will move the blog to Cloudflare's Workers at some point (they appear to be deprecating their much simpler Pages service).
