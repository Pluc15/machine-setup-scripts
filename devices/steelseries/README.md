# What is this

Steelseries has 2 output device. One for voice chats, one for the rest. The voice chat is the only one detected by default. Unfortunatly, that chanel is mono. This fix will add the missing stereo channel.

# Install

```bash
sh install.sh
```

# Troubleshoot

## Device firmware upgrade

After a firmware upgrade, it's possible the ID of the device changes

* Run `lsusb | grep SteelSeries`
* Find the line with `Bus 002 Device 003: ID 1038:XXXX SteelSeries ApS`
* Modify `90-pulseaudio-steelseries-arctis.rules` by replacing `12ad` with the value found at `XXXX`