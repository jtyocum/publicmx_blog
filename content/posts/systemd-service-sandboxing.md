---
title: "SystemD Service Sandboxing"
date: 2021-02-14T13:42:23-08:00
---

SystemD is loved by some, hated by others. It offers a wide range of features, beyond that of a simple init system. And, today I want to talk about service sandboxing. Now, I know what you're going to say, why not use containers. Containers aren't always an option, such as trying to improve security in an existing application deployment. With SystemD, sandboxing is a relatively simple process, just a simple text file defining what capabilities, system calls, and file system paths the service can write to. You can even go further, and run the service under a dynamically generated user account.

Below, is an example of a sandbox configuration for Apache on Ubuntu 18.04. You'll notice several entries under SystemCallFilter. If you are running a newer distro, check your systemd man pages. It may offer more system call groups, making this configuration a bit simpler.

```
[Service]
CapabilityBoundingSet=~CAP_SYS_ADMIN
ProtectSystem=strict
ProtectHome=yes
ReadWritePaths=/run /var/log /var/www /var/cache /tmp /var/tmp
PrivateDevices=yes
ProtectClock=yes
ProtectKernelTunables=yes
ProtectKernelModules=yes
ProtectKernelLogs=yes
ProtectControlGroups=yes
LockPersonality=yes
SystemCallFilter=~@clock @cpu-emulation @debug @obsolete @module @mount @raw-io @reboot @swap
SystemCallErrorNumber=EPERM
```

How do we go from sandbox config, to actual sandboxed service? Easy, just drop the config file into /etc/systemd/system/SOMESERVICE.service.d/sandbox.conf. You could use a different file name, but that seems most logical. Then, just use systemctl to reload, and then restart the service.

*Disclaimer:* The above is not the most secure configuration you could use. Or, it may be too secure for your environment. Adjust as needed.
