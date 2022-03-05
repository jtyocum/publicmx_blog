---
title: "Hosting Infrastructure Change"
date: 2021-05-06T09:28:52-07:00
---

It wasn't long ago that I moved my blog to IPFS. However, we're back to a traditional setup. The change wasn't due to some issue with IPFS, pinning service, etc. It was simply a change of requirements. I had a need for a VM to run some server-side logic for another project, so I chose to roll everything into one system. Here's what my current setup is:

* Registrar / DNS: Cloudflare
* VM Hosting: OVHcloud
* Email: Mailbox.org

On the VM side of things, I'm running:

* Ubuntu 20.04
* Caddy (been meaning to try this)
* Shiny Server (been meaning to play with this for some time)

As for VM specs, nothing fancy. Just 2 vCPU, 4GB RAM, and 80GB disk.

