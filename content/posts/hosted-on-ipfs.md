---
title: "Hosted on IPFS"
date: 2021-02-14T13:53:54-08:00
---

I recently moved my blog from a normal web host, to being hosted via [IPFS](https://ipfs.io/). IPFS is the decentralized web, essentially the web equivalent to Bittorrent. And, thanks to the power of HTTP to IPFS gateways, users without IPFS capable devices or software can still access content hosted on the distributed web. With IPFS, content can be hosted from anywhere, even your home computer. However, you can also choose to use commerical pinning services to keep your content online and distributed at all times. For my blog, I chose to use [Pinata](https://pinata.cloud/) to host the content, and took advantage of [Cloudflare's IPFS gateway](https://cloudflare-ipfs.com/) to enable normal browsers to access the site.

If you want to start accessing the distributed web. You'll need a couple things:

* IPFS Desktop
* IPFS Companion

This combination will enable you share content via the distributed web, and easily access content directly from your browser. If the Companion extension detects that a site is reachable via IPFS, it'll automatically redirect you to the IPFS version.
