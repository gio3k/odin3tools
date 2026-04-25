#!/bin/bash

# IMPORTANT VARIABLE!
# note: this stuff can be found in the modem_a partition (with stock firmware installed)
# an example is below
# PEACH_PATH=partitions/modem_a/image/peach

OUTPUT_PATH=output

if [ -z "${PEACH_PATH+set}" ]; then
    echo "the PEACH_PATH needs to be set! uncomment and change it at the top of the script"
    exit 1
fi

mkdir -p $OUTPUT_PATH

# Create board-2
cp $PEACH_PATH/bdwlan.e1f "bus=pci,vendor=17cb,device=110e,subsystem-vendor=17cb,subsystem-device=110e,qmi-chip-id=2,qmi-board-id=255.bin"
cp $PEACH_PATH/bdwlan.e1f "bus=pci,qmi-chip-id=2,qmi-board-id=31.bin"
cp $PEACH_PATH/regdb.bin "bus=pci,vendor=17cb,device=110e,subsystem-vendor=17cb,subsystem-device=110e,qmi-chip-id=2,qmi-board-id=255.regdb"
cp $PEACH_PATH/regdb.bin "bus=pci,qmi-chip-id=2,qmi-board-id=31.regdb"
ath12k-bdencoder -c board-2.json -o $OUTPUT_PATH/board-2.bin

# Create tmel (not required)
# MODEM_PATH=/home/gio/dev/odin3-reference/wlan/stock-modem/
# cp $MODEM_PATH/tmel_peach_20.elf $OUTPUT_PATH/tmel.bin

# Create amss
cp $PEACH_PATH/amss20.bin $OUTPUT_PATH/amss.bin

# Create aux_ucode
cp $PEACH_PATH/aux_ucode20.elf $OUTPUT_PATH/aux_ucode.bin

# Create m3
# WCN786x seems to have a signed Qualcomm elf (like qtestsign elf)
cp $PEACH_PATH/phy_ucode20.elf $OUTPUT_PATH/m3.bin

# Create regdb (it's already in the board-2.bin though)
cp $PEACH_PATH/regdb.bin $OUTPUT_PATH/regdb.bin

# Create qdss config
cp $PEACH_PATH/qdss_trace_config_v2.cfg $OUTPUT_PATH/qdss.cfg

echo done
