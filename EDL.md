## Fastboot(s)

The Odin 3 comes with two different versions of fastboot.

1. Bootloader fastboot
    - This is what shows up if you hold Vol Down when booting
    - It also shows up if your device can't boot successfully (corrupted partition, probably boot or init_boot)
    - **This fastboot is broken, and you can't flash or erase!**

2. Fastbootd ("userspace fastboot")
    - This can be accessed from recovery mode ("Enter fastboot" option)
    - You can flash and erase partitions normally from this one
    - This can become unreachable if your boot partitions are broken enough! (e.g. broken vbmeta)

Fastbootd is the useful one here - bootloader fastboot doesn't let you do anything.

If your device can't boot into fastbootd, you'll have to use EDL mode.

## EDL

EDL is "Emergency Download Mode". This runs before the bootloader and can be used to recover your device.

To use EDL, you first need to send a "[Firehose Loader](https://www.temblast.com/ref/loaders.htm)" to your device, then you can flash / erase partitions like normal fastboot.

As the Odin 3 has Secure Boot disabled, you can use any Firehose loader made for a similar chip. The best option at the moment seems to be the [Vivo iQOO 13 loader](https://archive.diablosat.cc/firmwares/amt-dumps/FirehoseLoaders/iqoo_13.melf).

## EDL Software

On Windows, you can use the [Temblast EDL Utility](https://www.temblast.com/edl.htm) for this.

These steps depend on what you use, so I'll keep it brief. For a Windows machine:

1. Install [Zadig](https://zadig.akeo.ie/) 
2. Use Zadig to install the WinUSB driver for your device
    - select the device starting with QUSB_BULK_ or similar
    - select the WinUSB driver (selection box to the right of the arrow)
    - click Install / Reinstall driver
3. Send the Firehose loader to your device using edl.exe
    - `edl.exe /liqoo_13.melf /qbd`
    - "/qbd" ignores some "quirks" of the chip - read more [here](https://www.temblast.com/edl.htm)
    - You should see some output like this: `Sending iqoo_13.melf 100% ok, starting... ok, waiting for Firehose... ok`
4. At this point, you can use the EDL tool normally.
5. To flash, figure out what LUN the partition is on, then use the write flag
    - Here's an example for flashing the boot_a partition.
    - Figure out the LUN with boot_a: `edl.exe /g /u<0-6>`
    - My device has boot_a on LUN 4, so: `edl.exe /u4 /w /pboot_a boot.img`

You can reboot your device with `edl.exe /z` (or by holding the power button)

## Troubleshooting
Your device might seem to not respond to anything (including the power button) and sometimes the USB connection stops working (so unplugging / replugging the USB won't work)

If this is happening, hold **all three top buttons**: Volume Up, Volume Down and Power for a minute or so

If this doesn't work, give the device a few minutes and try again. This usually works for me - if nothing works you could try unplugging the battery (luckily the Odin 3 is pretty easy to open)