#!/bin/sh

# !! note !!: output doesn't really come out of the Odin's Run script as Root
# on Odin use the bootstrap script "dump.sh" to run this properly
# if you need output run this in the shell as root

echo "Dumper script here!"

if [ $(id -u) -ne 0 ]; then
    echo "You need to run this script as root!"
    echo "If you're on an Odin 3, you can do this in the Android settings:"
    echo "    Settings -> Odin Settings -> Run script as Root"
    echo "If you're on another device, you need to root it first."
    exit 1
fi

# Prepare our output folder
echo "Creating dump folder..."
export DUMP_DIR=/storage/emulated/0/Dumps/$(date +%s)/
mkdir -p $DUMP_DIR
mkdir -p $DUMP_DIR/blocks
mkdir -p $DUMP_DIR/linux

# Dump block devices (except the big ones)
echo "Dumping block devices..."
# !! note !!: feel free to uncomment the below line (userdata) if you have enough space, I don't think you need it for restoration though
# dd if=/dev/block/by-name/userdata of=$DUMP_DIR/blocks/userdata.img

# !! note !!: Don't uncomment these unless you have a reason, they're huge and they consist of the below partitions we're dumping already
#dd if=/dev/block/by-name/rawdump of=$DUMP_DIR/blocks/rawdump.img
#dd if=/dev/block/by-name/sda of=$DUMP_DIR/blocks/sda.img
#dd if=/dev/block/by-name/sdb of=$DUMP_DIR/blocks/sdb.img
#dd if=/dev/block/by-name/sdc of=$DUMP_DIR/blocks/sdc.img
#dd if=/dev/block/by-name/sdd of=$DUMP_DIR/blocks/sdd.img
#dd if=/dev/block/by-name/sde of=$DUMP_DIR/blocks/sde.img
#dd if=/dev/block/by-name/sdf of=$DUMP_DIR/blocks/sdf.img
#dd if=/dev/block/by-name/sdg of=$DUMP_DIR/blocks/sdg.img
#dd if=/dev/block/by-name/sdh of=$DUMP_DIR/blocks/sdh.img

# Actually dump the partitions
dd if=/dev/block/by-name/ALIGN_TO_128K_1 of=$DUMP_DIR/blocks/ALIGN_TO_128K_1.img
dd if=/dev/block/by-name/ALIGN_TO_128K_2 of=$DUMP_DIR/blocks/ALIGN_TO_128K_2.img
dd if=/dev/block/by-name/abl_a of=$DUMP_DIR/blocks/abl_a.img
dd if=/dev/block/by-name/abl_b of=$DUMP_DIR/blocks/abl_b.img
dd if=/dev/block/by-name/aop_a of=$DUMP_DIR/blocks/aop_a.img
dd if=/dev/block/by-name/aop_b of=$DUMP_DIR/blocks/aop_b.img
dd if=/dev/block/by-name/aop_config_a of=$DUMP_DIR/blocks/aop_config_a.img
dd if=/dev/block/by-name/aop_config_b of=$DUMP_DIR/blocks/aop_config_b.img
dd if=/dev/block/by-name/apdp of=$DUMP_DIR/blocks/apdp.img
dd if=/dev/block/by-name/apdpb of=$DUMP_DIR/blocks/apdpb.img
dd if=/dev/block/by-name/bluetooth_a of=$DUMP_DIR/blocks/bluetooth_a.img
dd if=/dev/block/by-name/bluetooth_b of=$DUMP_DIR/blocks/bluetooth_b.img
dd if=/dev/block/by-name/boot_a of=$DUMP_DIR/blocks/boot_a.img
dd if=/dev/block/by-name/boot_b of=$DUMP_DIR/blocks/boot_b.img
dd if=/dev/block/by-name/cdt of=$DUMP_DIR/blocks/cdt.img
dd if=/dev/block/by-name/connsec of=$DUMP_DIR/blocks/connsec.img
dd if=/dev/block/by-name/cpucp_a of=$DUMP_DIR/blocks/cpucp_a.img
dd if=/dev/block/by-name/cpucp_b of=$DUMP_DIR/blocks/cpucp_b.img
dd if=/dev/block/by-name/cpucp_dtb_a of=$DUMP_DIR/blocks/cpucp_dtb_a.img
dd if=/dev/block/by-name/cpucp_dtb_b of=$DUMP_DIR/blocks/cpucp_dtb_b.img
dd if=/dev/block/by-name/ddr of=$DUMP_DIR/blocks/ddr.img
dd if=/dev/block/by-name/devcfg_a of=$DUMP_DIR/blocks/devcfg_a.img
dd if=/dev/block/by-name/devcfg_b of=$DUMP_DIR/blocks/devcfg_b.img
dd if=/dev/block/by-name/devinfo of=$DUMP_DIR/blocks/devinfo.img
dd if=/dev/block/by-name/dpm of=$DUMP_DIR/blocks/dpm.img
dd if=/dev/block/by-name/dsp_a of=$DUMP_DIR/blocks/dsp_a.img
dd if=/dev/block/by-name/dsp_b of=$DUMP_DIR/blocks/dsp_b.img
dd if=/dev/block/by-name/dtbo_a of=$DUMP_DIR/blocks/dtbo_a.img
dd if=/dev/block/by-name/dtbo_b of=$DUMP_DIR/blocks/dtbo_b.img
dd if=/dev/block/by-name/featenabler_a of=$DUMP_DIR/blocks/featenabler_a.img
dd if=/dev/block/by-name/featenabler_b of=$DUMP_DIR/blocks/featenabler_b.img
dd if=/dev/block/by-name/frp of=$DUMP_DIR/blocks/frp.img
dd if=/dev/block/by-name/fsc of=$DUMP_DIR/blocks/fsc.img
dd if=/dev/block/by-name/fsg of=$DUMP_DIR/blocks/fsg.img
dd if=/dev/block/by-name/hyp_a of=$DUMP_DIR/blocks/hyp_a.img
dd if=/dev/block/by-name/hyp_b of=$DUMP_DIR/blocks/hyp_b.img
dd if=/dev/block/by-name/imagefv_a of=$DUMP_DIR/blocks/imagefv_a.img
dd if=/dev/block/by-name/imagefv_b of=$DUMP_DIR/blocks/imagefv_b.img
dd if=/dev/block/by-name/init_boot_a of=$DUMP_DIR/blocks/init_boot_a.img
dd if=/dev/block/by-name/init_boot_b of=$DUMP_DIR/blocks/init_boot_b.img
dd if=/dev/block/by-name/keymaster_a of=$DUMP_DIR/blocks/keymaster_a.img
dd if=/dev/block/by-name/keymaster_b of=$DUMP_DIR/blocks/keymaster_b.img
dd if=/dev/block/by-name/keystore of=$DUMP_DIR/blocks/keystore.img
dd if=/dev/block/by-name/logdump of=$DUMP_DIR/blocks/logdump.img
dd if=/dev/block/by-name/logfs of=$DUMP_DIR/blocks/logfs.img
dd if=/dev/block/by-name/mdcompress of=$DUMP_DIR/blocks/mdcompress.img
dd if=/dev/block/by-name/metadata of=$DUMP_DIR/blocks/metadata.img
dd if=/dev/block/by-name/misc of=$DUMP_DIR/blocks/misc.img
dd if=/dev/block/by-name/modem_a of=$DUMP_DIR/blocks/modem_a.img
dd if=/dev/block/by-name/modem_b of=$DUMP_DIR/blocks/modem_b.img
dd if=/dev/block/by-name/modemst1 of=$DUMP_DIR/blocks/modemst1.img
dd if=/dev/block/by-name/modemst2 of=$DUMP_DIR/blocks/modemst2.img
dd if=/dev/block/by-name/multiimgoem_a of=$DUMP_DIR/blocks/multiimgoem_a.img
dd if=/dev/block/by-name/multiimgoem_b of=$DUMP_DIR/blocks/multiimgoem_b.img
dd if=/dev/block/by-name/multiimgqti_a of=$DUMP_DIR/blocks/multiimgqti_a.img
dd if=/dev/block/by-name/multiimgqti_b of=$DUMP_DIR/blocks/multiimgqti_b.img
dd if=/dev/block/by-name/nvdata1 of=$DUMP_DIR/blocks/nvdata1.img
dd if=/dev/block/by-name/nvdata2 of=$DUMP_DIR/blocks/nvdata2.img
dd if=/dev/block/by-name/pdp_a of=$DUMP_DIR/blocks/pdp_a.img
dd if=/dev/block/by-name/pdp_b of=$DUMP_DIR/blocks/pdp_b.img
dd if=/dev/block/by-name/pdp_cdb_a of=$DUMP_DIR/blocks/pdp_cdb_a.img
dd if=/dev/block/by-name/pdp_cdb_b of=$DUMP_DIR/blocks/pdp_cdb_b.img
dd if=/dev/block/by-name/persist of=$DUMP_DIR/blocks/persist.img
dd if=/dev/block/by-name/pvmfw_a of=$DUMP_DIR/blocks/pvmfw_a.img
dd if=/dev/block/by-name/pvmfw_b of=$DUMP_DIR/blocks/pvmfw_b.img
dd if=/dev/block/by-name/qmcs of=$DUMP_DIR/blocks/qmcs.img
dd if=/dev/block/by-name/qpdata1 of=$DUMP_DIR/blocks/qpdata1.img
dd if=/dev/block/by-name/qpdata2 of=$DUMP_DIR/blocks/qpdata2.img
dd if=/dev/block/by-name/qupfw_a of=$DUMP_DIR/blocks/qupfw_a.img
dd if=/dev/block/by-name/qupfw_b of=$DUMP_DIR/blocks/qupfw_b.img
dd if=/dev/block/by-name/qweslicstore_a of=$DUMP_DIR/blocks/qweslicstore_a.img
dd if=/dev/block/by-name/qweslicstore_b of=$DUMP_DIR/blocks/qweslicstore_b.img
dd if=/dev/block/by-name/recovery_a of=$DUMP_DIR/blocks/recovery_a.img
dd if=/dev/block/by-name/recovery_b of=$DUMP_DIR/blocks/recovery_b.img
dd if=/dev/block/by-name/reserve1 of=$DUMP_DIR/blocks/reserve1.img
dd if=/dev/block/by-name/reserve2 of=$DUMP_DIR/blocks/reserve2.img
dd if=/dev/block/by-name/secdata of=$DUMP_DIR/blocks/secdata.img
dd if=/dev/block/by-name/shrm_a of=$DUMP_DIR/blocks/shrm_a.img
dd if=/dev/block/by-name/shrm_b of=$DUMP_DIR/blocks/shrm_b.img
dd if=/dev/block/by-name/soccp_dcd_a of=$DUMP_DIR/blocks/soccp_dcd_a.img
dd if=/dev/block/by-name/soccp_dcd_b of=$DUMP_DIR/blocks/soccp_dcd_b.img
dd if=/dev/block/by-name/soccp_debug_a of=$DUMP_DIR/blocks/soccp_debug_a.img
dd if=/dev/block/by-name/soccp_debug_b of=$DUMP_DIR/blocks/soccp_debug_b.img
dd if=/dev/block/by-name/splash of=$DUMP_DIR/blocks/splash.img
dd if=/dev/block/by-name/spunvm of=$DUMP_DIR/blocks/spunvm.img
dd if=/dev/block/by-name/spuservice_a of=$DUMP_DIR/blocks/spuservice_a.img
dd if=/dev/block/by-name/spuservice_b of=$DUMP_DIR/blocks/spuservice_b.img
dd if=/dev/block/by-name/ssd of=$DUMP_DIR/blocks/ssd.img
dd if=/dev/block/by-name/storsec of=$DUMP_DIR/blocks/storsec.img
dd if=/dev/block/by-name/super of=$DUMP_DIR/blocks/super.img
dd if=/dev/block/by-name/toolsfv of=$DUMP_DIR/blocks/toolsfv.img
dd if=/dev/block/by-name/tz_a of=$DUMP_DIR/blocks/tz_a.img
dd if=/dev/block/by-name/tz_b of=$DUMP_DIR/blocks/tz_b.img
dd if=/dev/block/by-name/tzsc of=$DUMP_DIR/blocks/tzsc.img
dd if=/dev/block/by-name/uefi_a of=$DUMP_DIR/blocks/uefi_a.img
dd if=/dev/block/by-name/uefi_b of=$DUMP_DIR/blocks/uefi_b.img
dd if=/dev/block/by-name/uefisecapp_a of=$DUMP_DIR/blocks/uefisecapp_a.img
dd if=/dev/block/by-name/uefisecapp_b of=$DUMP_DIR/blocks/uefisecapp_b.img
dd if=/dev/block/by-name/uefivarstore of=$DUMP_DIR/blocks/uefivarstore.img
dd if=/dev/block/by-name/vbmeta_a of=$DUMP_DIR/blocks/vbmeta_a.img
dd if=/dev/block/by-name/vbmeta_b of=$DUMP_DIR/blocks/vbmeta_b.img
dd if=/dev/block/by-name/vbmeta_system_a of=$DUMP_DIR/blocks/vbmeta_system_a.img
dd if=/dev/block/by-name/vbmeta_system_b of=$DUMP_DIR/blocks/vbmeta_system_b.img
dd if=/dev/block/by-name/vendor_boot_a of=$DUMP_DIR/blocks/vendor_boot_a.img
dd if=/dev/block/by-name/vendor_boot_b of=$DUMP_DIR/blocks/vendor_boot_b.img
dd if=/dev/block/by-name/vm-bootsys_a of=$DUMP_DIR/blocks/vm-bootsys_a.img
dd if=/dev/block/by-name/vm-bootsys_b of=$DUMP_DIR/blocks/vm-bootsys_b.img
dd if=/dev/block/by-name/vm-persist of=$DUMP_DIR/blocks/vm-persist.img
dd if=/dev/block/by-name/xbl_a of=$DUMP_DIR/blocks/xbl_a.img
dd if=/dev/block/by-name/xbl_b of=$DUMP_DIR/blocks/xbl_b.img
dd if=/dev/block/by-name/xbl_config_a of=$DUMP_DIR/blocks/xbl_config_a.img
dd if=/dev/block/by-name/xbl_config_b of=$DUMP_DIR/blocks/xbl_config_b.img
dd if=/dev/block/by-name/xbl_ramdump_a of=$DUMP_DIR/blocks/xbl_ramdump_a.img
dd if=/dev/block/by-name/xbl_ramdump_b of=$DUMP_DIR/blocks/xbl_ramdump_b.img
dd if=/dev/block/by-name/xbl_sc_logs of=$DUMP_DIR/blocks/xbl_sc_logs.img
dd if=/dev/block/by-name/xbl_sc_test_mode of=$DUMP_DIR/blocks/xbl_sc_test_mode.img

# Dump some basic info
echo "Dumping kernel info..."
uname -a > $DUMP_DIR/linux/uname.txt
cat /proc/cpuinfo > $DUMP_DIR/linux/cpuinfo.txt
cat /proc/bootconfig > $DUMP_DIR/linux/bootconfig.txt
cat /proc/cmdline > $DUMP_DIR/linux/cmdline.txt

# Dump kernel config & FDT
dd if=/proc/config.gz of=$DUMP_DIR/linux/config.gz
dd if=/sys/firmware/fdt of=$DUMP_DIR/linux/fdt

# Update permissions
echo "Updating permissions..."
chmod -R 777 $DUMP_DIR

echo "Done!"