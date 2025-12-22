#!/bin/sh
# Odin's "Run script as Root" feature is weird, so this just bootstraps the dumper script
# We just download the actual script ("Run script as Root" runs with the working dir as / so we wouldn't know where the script is)
curl -fsSL https://raw.githubusercontent.com/gio3k/odin3tools/main/odin3tools/dump-partitions-from-android/src/dump-device.sh -o /storage/emulated/0/Download/you-can-delete-this-dump-device.sh
mkdir -p /storage/emulated/0/Dumps
/bin/sh /storage/emulated/0/Download/you-can-delete-this-dump-device.sh > /storage/emulated/0/Dumps/dump-all-output.txt 2>&1
rm /storage/emulated/0/Download/you-can-delete-this-dump-device.sh