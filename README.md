# Odin 3 firmware tools and info

## Documentation

Partition dumping guide: [dump-partitions-from-android/](./dump-partitions-from-android)

Fastboot information and tiny EDL guide: [EDL.md](./EDL.md)

## Development

### Wi-Fi and Bluetooth

The Odin 3 uses the Qualcomm WCN7861 (peach) chip for Wi-Fi and Bluetooth. It handles firmware differently to previous versions.

ath12k firmware creation tools: [ath12k/wcn7860-firmware-scripts/](./ath12k/wcn7860-firmware-scripts/README.md)

ath12k coredump dumper: [@gio3k/ath12k-coredump-dumper (github)](https://github.com/gio3k/ath12k-coredump-dumper)

### Linux

Linux sources are now available: [@AYNTechnologies/linux (github)](https://github.com/AYNTechnologies/linux)

## File Resources

Firehose Loader (iQOO 13): [iqoo_13.melf](https://archive.diablosat.cc/firmwares/amt-dumps/FirehoseLoaders/iqoo_13.melf)

Stock Device Tree (dtb + dts from decompile): [resources/stock-device-tree/](./resources/stock-device-tree)
