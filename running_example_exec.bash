running_example~$ west build -t run
-- west build: build configuration:
       source directory: 
running_example
       build directory: 
running_example/build
       BOARD: native_posix (origin: CMakeCache.txt)
-- west build: running target run
[0/1] cd /home/...nning_example/build/zephyr/zephyr.exe
*** Booting Zephyr OS build zephyr-v2.2.0  ***
[00:00:00.000,000] <inf> fs_nvs: 4 Sectors of 4096 bytes
[00:00:00.000,000] <inf> fs_nvs: alloc wra: 0, ff0
[00:00:00.000,000] <inf> fs_nvs: data wra: 0, 0
[00:00:00.000,000] <inf> zeta: NVS started...[OK]
[00:00:00.000,000] <inf> zeta: [ ] Recovering data from flash
[00:00:00.000,000] <inf> zeta: [X] Recovering data from flash
[00:00:00.000,000] <dbg> zeta.SENSOR_task: SENSOR Service has started...[OK]
[00:00:00.000,000] <dbg> zeta.ACTUATOR_task: ACTUATOR Service has started...[OK]
[00:00:00.000,000] <dbg> zeta.CORE_task: CORE Service has started...[OK]
[00:00:00.000,000] <dbg> zeta.CORE_task: Firmware version v0.5
[00:00:02.010,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:02.010,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:02.010,000] <dbg> zeta.CORE_task: Checking condition 0x7da & 0x10 = 1
[00:00:02.010,000] <wrn> zeta: Actuator turning ON
[00:00:04.020,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:04.020,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:04.020,000] <dbg> zeta.CORE_task: Checking condition 0xfb4 & 0x10 = 1
[00:00:06.030,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:06.030,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:06.030,000] <dbg> zeta.CORE_task: Checking condition 0x178e & 0x10 = 0
[00:00:06.030,000] <wrn> zeta: Actuator turning OFF
[00:00:08.040,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:08.040,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:08.040,000] <dbg> zeta.CORE_task: Checking condition 0x1f68 & 0x10 = 0
[00:00:10.050,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:10.050,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:10.050,000] <dbg> zeta.CORE_task: Checking condition 0x2742 & 0x10 = 0
[00:00:12.060,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:12.060,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:12.060,000] <dbg> zeta.CORE_task: Checking condition 0x2f1c & 0x10 = 1
[00:00:12.060,000] <wrn> zeta: Actuator turning ON
[00:00:14.070,000] <dbg> zeta.SENSOR_task: Publishing data to SENSOR_DATA
[00:00:14.070,000] <dbg> zeta.CORE_task: Receive SENSOR_DATA
[00:00:14.070,000] <dbg> zeta.CORE_task: Checking condition 0x36f6 & 0x10 = 1
^C
Stopped at 15.580s
ninja: build stopped: interrupted by user.

