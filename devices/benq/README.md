# What is this

When you have an ultra-wide monitor, sometimes it's useful to get a regular 16:9 ratio monitor. This is a little script to split my BenQ ultra-wide monitor into a 16:9 monitor plus and extra side panel monitor.

# Install

```bash
sh install.sh
```

# Usage

* To split monitor in two:

```bash
.monitor-split
```

* To revert to a normal ultra-wide:

```bash
.monitor-merge
```

# Troubleshoot

* `xrandr --listmonitors` and look for the `3440x1440` monitor.
* Replace `HDMI-0` with the monitor found.
