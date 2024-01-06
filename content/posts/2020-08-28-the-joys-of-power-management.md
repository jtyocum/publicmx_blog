---
title: "The Joys of Power Management"
date: 2020-08-28
---

OK, so not really joyful. I've got an HP Proliant ML10 V2 as my home VM host. Recently I redid the system, and reset the BIOS. While setting things up, I noticed it was unusually slow. The only changes from the previous setup was OS (it's now running Windows Server 2019 Standard, had been running OpenBSD 6.7), and the BIOS being reset. OK, so that's a lot of changes.

Ran through the basics. Checked CPU usage, it was nice and low. Checked the drives to make sure they weren't failing, S.M.A.R.T. said all is well. Made sure drivers were all up to date, along with firmware. Then, I went back to having Performance Monitor and Task Manager open while doing basic administrative tasks, and noticed it... the CPU clock speed was reported as 0.11 GHz, and wasn't fluctuating at all. Checked Windows power management profiles, and they were set correctly. Went into iLO, and checked power management, and saw it was set to "Dynamic Power Saving". Switched it to "OS", and rebooted....

POST takes forever on this machine. But, once it finished, in a couple blinks I was staring at the Windows logon screen. Performance was back, and CPU clock speed fluctuated as system load changed.
