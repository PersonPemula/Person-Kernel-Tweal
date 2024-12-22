#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

touch /storage/emulated/0/person-kt.log

LOG_FILE="/storage/emulated/0/person-kt.log"
DATE_EXEC=$(date +"%d-%m-%Y %r") || echo "Error getting date" >> $LOG_FILE

[ -w "$LOG_FILE" ] && echo " •> Person Kernel Tweak Exec at $DATE_EXEC" >> $LOG_FILE || echo "Cannot write to log file: $LOG_FILE"

# Kernel Panic and Debugging
for path in /sys/module/kernel/parameters/panic /proc/sys/kernel/panic_on_oops /sys/module/kernel/parameters/panic_on_warn /sys/module/kernel/parameters/pause_on_oops /proc/sys/vm/panic_on_oom; do
  echo '0' > $path
done

# Memory Management
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo '1' > /sys/module/zswap/parameters/enabled
echo '8' > /sys/block/zram0/max_comp_streams
echo '100' > /proc/sys/vm/overcommit_ratio
echo '20' > /proc/sys/vm/vfs_cache_pressure
echo '750' > /proc/sys/vm/extfrag_threshold
echo '27337' > /proc/sys/vm/extra_free_kbytes
echo '6422' > /proc/sys/vm/min_free_kbytes

# CPU and I/O Scheduler
echo 'deadline' > /sys/block/mmcblk0rpmb/queue/scheduler
echo 'deadline' > /sys/block/mmcblk0/queue/scheduler
echo 'deadline' > /sys/block/mmcblk1/queue/scheduler
echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '1024' > /sys/block/mmcblk1/queue/read_ahead_kb

# Cpuset Configuration
echo '0-2' > /dev/cpuset/background/cpus
echo '0-7' > /dev/cpuset/top-app/cpus
echo '3,4-6,7' > /dev/cpuset/foreground/cpus
echo '0-1' > /dev/cpuset/system-background/cpus

# Stune Configuration
for stune in /dev/stune/*; do
  echo '0' > ${stune}/schedtune.boost
done
echo '70' > /dev/stune/top-app/schedtune.boost

# Uclamp Configuration
for cpuset in /dev/cpuset/*; do
  echo 'max' > ${cpuset}/uclamp.max
  echo '10' > ${cpuset}/uclamp.min
done

# Misc Settings
echo '2048' > /proc/sys/kernel/random/read_wakeup_threshold
echo '2048' > /proc/sys/kernel/random/write_wakeup_threshold
echo '0' > /proc/sys/kernel/sysctl_writes_strict
echo '0' > /proc/sys/kernel/sched_tunable_scaling

# Apply all settings
sysctl -p

# Clean up and optimize
sleep 30
echo '3' > /proc/sys/vm/drop_caches
