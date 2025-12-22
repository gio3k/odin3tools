dump#!/bin/sh

# !! note !!: output doesn't really come out of the Odin's Run script as Root
# if you need output run this in the shell as root

echo "Dumper script here!"

if [ "$(id -u)" -ne 0 ]; then echo "This script requires root.\nOn an Odin3: Run using Settings > Odin settings > Run script as Root" >&2; exit 1; fi

# We can't use variables - Odin 3's script runner seems to run line by line in a subshell each time!
# We'll just hardcode the dump output and move it at the end
echo "Creating temporary folders..."
mkdir -p /storage/emulated/0/Dumps/dump-in-progress
mkdir -p /storage/emulated/0/Dumps/dump-in-progress/blocks
mkdir -p /storage/emulated/0/Dumps/dump-in-progress/linux

# Dump block devices (except the big ones)
echo "Dumping block devices..."
# !! note !!: feel free to uncomment the below line (userdata) if you have enough space, I don't think you need it for restoration though
# dd if=/dev/block/by-name/userdata of=/storage/emulated/0/Dumps/dump-in-progress/blocks/userdata.img

# !! note !!: Don't uncomment these unless you have a reason, they're huge and they consist of the below partitions we're dumping already
#dd if=/dev/block/by-name/rawdump of=/storage/emulated/0/Dumps/dump-in-progress/blocks/rawdump.img
#dd if=/dev/block/by-name/sda of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sda.img
#dd if=/dev/block/by-name/sdb of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sdb.img
#dd if=/dev/block/by-name/sdc of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sdc.img
#dd if=/dev/block/by-name/sdd of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sdd.img
#dd if=/dev/block/by-name/sde of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sde.img
#dd if=/dev/block/by-name/sdf of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sdf.img
#dd if=/dev/block/by-name/sdg of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sdg.img
#dd if=/dev/block/by-name/sdh of=/storage/emulated/0/Dumps/dump-in-progress/blocks/sdh.img

# Actually dump the partitions
dd if=/dev/block/by-name/ALIGN_TO_128K_1 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/ALIGN_TO_128K_1.img
dd if=/dev/block/by-name/ALIGN_TO_128K_2 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/ALIGN_TO_128K_2.img
dd if=/dev/block/by-name/abl_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/abl_a.img
dd if=/dev/block/by-name/abl_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/abl_b.img
dd if=/dev/block/by-name/aop_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/aop_a.img
dd if=/dev/block/by-name/aop_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/aop_b.img
dd if=/dev/block/by-name/aop_config_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/aop_config_a.img
dd if=/dev/block/by-name/aop_config_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/aop_config_b.img
dd if=/dev/block/by-name/apdp of=/storage/emulated/0/Dumps/dump-in-progress/blocks/apdp.img
dd if=/dev/block/by-name/apdpb of=/storage/emulated/0/Dumps/dump-in-progress/blocks/apdpb.img
dd if=/dev/block/by-name/bluetooth_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/bluetooth_a.img
dd if=/dev/block/by-name/bluetooth_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/bluetooth_b.img
dd if=/dev/block/by-name/boot_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/boot_a.img
dd if=/dev/block/by-name/boot_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/boot_b.img
dd if=/dev/block/by-name/cdt of=/storage/emulated/0/Dumps/dump-in-progress/blocks/cdt.img
dd if=/dev/block/by-name/connsec of=/storage/emulated/0/Dumps/dump-in-progress/blocks/connsec.img
dd if=/dev/block/by-name/cpucp_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/cpucp_a.img
dd if=/dev/block/by-name/cpucp_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/cpucp_b.img
dd if=/dev/block/by-name/cpucp_dtb_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/cpucp_dtb_a.img
dd if=/dev/block/by-name/cpucp_dtb_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/cpucp_dtb_b.img
dd if=/dev/block/by-name/ddr of=/storage/emulated/0/Dumps/dump-in-progress/blocks/ddr.img
dd if=/dev/block/by-name/devcfg_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/devcfg_a.img
dd if=/dev/block/by-name/devcfg_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/devcfg_b.img
dd if=/dev/block/by-name/devinfo of=/storage/emulated/0/Dumps/dump-in-progress/blocks/devinfo.img
dd if=/dev/block/by-name/dpm of=/storage/emulated/0/Dumps/dump-in-progress/blocks/dpm.img
dd if=/dev/block/by-name/dsp_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/dsp_a.img
dd if=/dev/block/by-name/dsp_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/dsp_b.img
dd if=/dev/block/by-name/dtbo_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/dtbo_a.img
dd if=/dev/block/by-name/dtbo_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/dtbo_b.img
dd if=/dev/block/by-name/featenabler_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/featenabler_a.img
dd if=/dev/block/by-name/featenabler_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/featenabler_b.img
dd if=/dev/block/by-name/frp of=/storage/emulated/0/Dumps/dump-in-progress/blocks/frp.img
dd if=/dev/block/by-name/fsc of=/storage/emulated/0/Dumps/dump-in-progress/blocks/fsc.img
dd if=/dev/block/by-name/fsg of=/storage/emulated/0/Dumps/dump-in-progress/blocks/fsg.img
dd if=/dev/block/by-name/hyp_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/hyp_a.img
dd if=/dev/block/by-name/hyp_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/hyp_b.img
dd if=/dev/block/by-name/imagefv_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/imagefv_a.img
dd if=/dev/block/by-name/imagefv_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/imagefv_b.img
dd if=/dev/block/by-name/init_boot_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/init_boot_a.img
dd if=/dev/block/by-name/init_boot_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/init_boot_b.img
dd if=/dev/block/by-name/keymaster_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/keymaster_a.img
dd if=/dev/block/by-name/keymaster_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/keymaster_b.img
dd if=/dev/block/by-name/keystore of=/storage/emulated/0/Dumps/dump-in-progress/blocks/keystore.img
dd if=/dev/block/by-name/logdump of=/storage/emulated/0/Dumps/dump-in-progress/blocks/logdump.img
dd if=/dev/block/by-name/logfs of=/storage/emulated/0/Dumps/dump-in-progress/blocks/logfs.img
dd if=/dev/block/by-name/mdcompress of=/storage/emulated/0/Dumps/dump-in-progress/blocks/mdcompress.img
dd if=/dev/block/by-name/metadata of=/storage/emulated/0/Dumps/dump-in-progress/blocks/metadata.img
dd if=/dev/block/by-name/misc of=/storage/emulated/0/Dumps/dump-in-progress/blocks/misc.img
dd if=/dev/block/by-name/modem_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/modem_a.img
dd if=/dev/block/by-name/modem_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/modem_b.img
dd if=/dev/block/by-name/modemst1 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/modemst1.img
dd if=/dev/block/by-name/modemst2 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/modemst2.img
dd if=/dev/block/by-name/multiimgoem_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/multiimgoem_a.img
dd if=/dev/block/by-name/multiimgoem_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/multiimgoem_b.img
dd if=/dev/block/by-name/multiimgqti_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/multiimgqti_a.img
dd if=/dev/block/by-name/multiimgqti_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/multiimgqti_b.img
dd if=/dev/block/by-name/nvdata1 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/nvdata1.img
dd if=/dev/block/by-name/nvdata2 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/nvdata2.img
dd if=/dev/block/by-name/pdp_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/pdp_a.img
dd if=/dev/block/by-name/pdp_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/pdp_b.img
dd if=/dev/block/by-name/pdp_cdb_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/pdp_cdb_a.img
dd if=/dev/block/by-name/pdp_cdb_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/pdp_cdb_b.img
dd if=/dev/block/by-name/persist of=/storage/emulated/0/Dumps/dump-in-progress/blocks/persist.img
dd if=/dev/block/by-name/pvmfw_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/pvmfw_a.img
dd if=/dev/block/by-name/pvmfw_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/pvmfw_b.img
dd if=/dev/block/by-name/qmcs of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qmcs.img
dd if=/dev/block/by-name/qpdata1 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qpdata1.img
dd if=/dev/block/by-name/qpdata2 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qpdata2.img
dd if=/dev/block/by-name/qupfw_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qupfw_a.img
dd if=/dev/block/by-name/qupfw_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qupfw_b.img
dd if=/dev/block/by-name/qweslicstore_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qweslicstore_a.img
dd if=/dev/block/by-name/qweslicstore_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/qweslicstore_b.img
dd if=/dev/block/by-name/recovery_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/recovery_a.img
dd if=/dev/block/by-name/recovery_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/recovery_b.img
dd if=/dev/block/by-name/reserve1 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/reserve1.img
dd if=/dev/block/by-name/reserve2 of=/storage/emulated/0/Dumps/dump-in-progress/blocks/reserve2.img
dd if=/dev/block/by-name/secdata of=/storage/emulated/0/Dumps/dump-in-progress/blocks/secdata.img
dd if=/dev/block/by-name/shrm_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/shrm_a.img
dd if=/dev/block/by-name/shrm_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/shrm_b.img
dd if=/dev/block/by-name/soccp_dcd_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/soccp_dcd_a.img
dd if=/dev/block/by-name/soccp_dcd_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/soccp_dcd_b.img
dd if=/dev/block/by-name/soccp_debug_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/soccp_debug_a.img
dd if=/dev/block/by-name/soccp_debug_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/soccp_debug_b.img
dd if=/dev/block/by-name/splash of=/storage/emulated/0/Dumps/dump-in-progress/blocks/splash.img
dd if=/dev/block/by-name/spunvm of=/storage/emulated/0/Dumps/dump-in-progress/blocks/spunvm.img
dd if=/dev/block/by-name/spuservice_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/spuservice_a.img
dd if=/dev/block/by-name/spuservice_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/spuservice_b.img
dd if=/dev/block/by-name/ssd of=/storage/emulated/0/Dumps/dump-in-progress/blocks/ssd.img
dd if=/dev/block/by-name/storsec of=/storage/emulated/0/Dumps/dump-in-progress/blocks/storsec.img
dd if=/dev/block/by-name/super of=/storage/emulated/0/Dumps/dump-in-progress/blocks/super.img
dd if=/dev/block/by-name/toolsfv of=/storage/emulated/0/Dumps/dump-in-progress/blocks/toolsfv.img
dd if=/dev/block/by-name/tz_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/tz_a.img
dd if=/dev/block/by-name/tz_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/tz_b.img
dd if=/dev/block/by-name/tzsc of=/storage/emulated/0/Dumps/dump-in-progress/blocks/tzsc.img
dd if=/dev/block/by-name/uefi_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/uefi_a.img
dd if=/dev/block/by-name/uefi_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/uefi_b.img
dd if=/dev/block/by-name/uefisecapp_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/uefisecapp_a.img
dd if=/dev/block/by-name/uefisecapp_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/uefisecapp_b.img
dd if=/dev/block/by-name/uefivarstore of=/storage/emulated/0/Dumps/dump-in-progress/blocks/uefivarstore.img
dd if=/dev/block/by-name/vbmeta_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vbmeta_a.img
dd if=/dev/block/by-name/vbmeta_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vbmeta_b.img
dd if=/dev/block/by-name/vbmeta_system_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vbmeta_system_a.img
dd if=/dev/block/by-name/vbmeta_system_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vbmeta_system_b.img
dd if=/dev/block/by-name/vendor_boot_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vendor_boot_a.img
dd if=/dev/block/by-name/vendor_boot_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vendor_boot_b.img
dd if=/dev/block/by-name/vm-bootsys_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vm-bootsys_a.img
dd if=/dev/block/by-name/vm-bootsys_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vm-bootsys_b.img
dd if=/dev/block/by-name/vm-persist of=/storage/emulated/0/Dumps/dump-in-progress/blocks/vm-persist.img
dd if=/dev/block/by-name/xbl_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_a.img
dd if=/dev/block/by-name/xbl_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_b.img
dd if=/dev/block/by-name/xbl_config_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_config_a.img
dd if=/dev/block/by-name/xbl_config_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_config_b.img
dd if=/dev/block/by-name/xbl_ramdump_a of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_ramdump_a.img
dd if=/dev/block/by-name/xbl_ramdump_b of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_ramdump_b.img
dd if=/dev/block/by-name/xbl_sc_logs of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_sc_logs.img
dd if=/dev/block/by-name/xbl_sc_test_mode of=/storage/emulated/0/Dumps/dump-in-progress/blocks/xbl_sc_test_mode.img

# Dump some basic info
echo "Dumping kernel info..."
uname -a > /storage/emulated/0/Dumps/dump-in-progress/linux/uname.txt
cat /proc/cpuinfo > /storage/emulated/0/Dumps/dump-in-progress/linux/cpuinfo.txt
cat /proc/bootconfig > /storage/emulated/0/Dumps/dump-in-progress/linux/bootconfig.txt
cat /proc/cmdline > /storage/emulated/0/Dumps/dump-in-progress/linux/cmdline.txt

# Dump kernel config & FDT
dd if=/proc/config.gz of=/storage/emulated/0/Dumps/dump-in-progress/linux/config.gz
dd if=/sys/firmware/fdt of=/storage/emulated/0/Dumps/dump-in-progress/linux/fdt

# Update permissions
echo "Updating permissions..."
DUMP_DIR="/storage/emulated/0/Dumps/$(date +%s)/" mv "/storage/emulated/0/Dumps/dump-in-progress" $DUMP_DIR; chmod -R 777 $DUMP_DIR

echo "Done!"