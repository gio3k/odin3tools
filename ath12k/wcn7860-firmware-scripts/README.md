# Firmware image generator for WCN7860

Until there are upstream firmware files for the WCN7860 family, you need to generate a board-2.bin to use in Linux

This script makes it easier

### Usage

Install [ath12k-bdencoder](https://github.com/qualcomm/qca-swiss-army-knife/blob/master/tools/scripts/ath12k/ath12k-bdencoder) on your system and put it in the PATH

Then change `PEACH_PATH` in `create.sh` and point it to your extracted firmware folder that contains *amss.bin* and a bunch of files starting with *bdwlan*
    - This is most likely in your modem_a partition: "partitions/modem_a/image/peach"

Run the script and your firmware should be in the *output/* folder