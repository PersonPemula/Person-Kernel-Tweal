#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

touch /storage/emulated/0/person-kt.log

LOG_FILE="/storage/emulated/0/Person-kt.log"
DATE_EXEC=$(date +"%d-%m-%Y %r") || echo "Error getting date" >> $LOG_FILE

if [ -w "$LOG_FILE" ]; then
  echo " •> Person Kernel Tweak Exec at $DATE_EXEC" >> $LOG_FILE
else
  echo "Cannot write to log file: $LOG_FILE"
fi


echo '0' > /sys/module/kernel/parameters/panic
echo '0' > /proc/sys/kernel/panic_on_oops
echo '0' > /sys/module/kernel/parameters/panic_on_warn
echo '0' > /sys/module/kernel/parameters/pause_on_oops
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo '0' > /proc/sys/vm/page-cluster
echo '8' > /sys/block/zram0/max_comp_streams 
echo '1' > /sys/module/zswap/parameters/enabled
echo '1' > /proc/sys/net/ipv4/tcp_low_latency
echo '0' > /proc/sys/vm/panic_on_oom;
echo '0' > /proc/sys/vm/page-cluster
echo 'Y' > /proc/sys/vm/swap_ratio_enable
echo '100' > /proc/sys/vm/overcommit_ratio
echo '1' > /proc/sys/vm/dirty_background_ratio;
echo '3' > /proc/sys/vm/dirty_ratio;
echo '20' > /proc/sys/vm/vfs_cache_pressure;
echo 750 > /proc/sys/vm/extfrag_threshold
echo 1 > /sys/devices/platform/soc/$(getprop ro.boot.bootdevice)/ufstw_lu0/tw_enable
echo 15000 > /proc/sys/vm/watermark_boost_factor
echo 5000 > /sys/kernel/mm/lru_gen/min_ttl_ms
echo 20 > /proc/sys/vm/stat_interval
echo 32 > /proc/sys/vm/watermark_scale_factor
echo 2 > /sys/module/kprofiles/parameters/mode
echo 20 > /proc/sys/kernel/sched_min_task_util_for_colocation
echo '6000' > /proc/sys/vm/dirty_writeback_centisecs;
echo '6000' > /proc/sys/vm/dirty_expire_centisecs;
echo '27337' > /proc/sys/vm/extra_free_kbytes
echo '6422' > /proc/sys/vm/min_free_kbytes;
echo '0' > /proc/sys/vm/oom_kill_allocating_task;
echo '0' > /sys/kernel/ccci/debug;
echo '0' > /proc/sys/kernel/sched_autogroup_enabled
echo '0' > /sys/module/subsystem_restart/parameters/enable_ramdumps
echo '0' > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
echo '1' > /proc/sys/kernel/timer_migration
echo '1' > /sys/devices/system/cpu/rq-stats/hotplug_disable
echo "NO_GENTLE_FAIR_SLEEPERS" > /sys/kernel/debug/sched_features
echo "NO_HRTICK" > /sys/kernel/debug/sched_features
echo "NO_DOUBLE_TICK" > /sys/kernel/debug/sched_features
echo "NO_RT_RUNTIME_SHARE" > /sys/kernel/debug/sched_features
echo "NEXT_BUDDY" > /sys/kernel/debug/sched_features
echo "NO_TTWU_QUEUE" > /sys/kernel/debug/sched_features
echo "UTIL_EST" > /sys/kernel/debug/sched_features
echo "ARCH_CAPACITY" > /sys/kernel/debug/sched_features
echo "ARCH_POWER" > /sys/kernel/debug/sched_features
echo '3' > sched_window_stats_policy
echo '3' > /proc/sys/kernel/sched_ravg_hist_size
echo '1' > /proc/sys/kernel/sched_restrict_tasks_spread
echo '3' > /proc/sys/kernel/sched_window_stats_policy
echo '1' > /proc/sys/kernel/sched_boost
echo '3' > /proc/sys/kernel/sched_spill_nr_run
echo '1' > /proc/sys/kernel/sched_restrict_cluster_spill
echo '1' > /proc/sys/kernel/sched_prefer_sync_wakee_to_waker
echo "200000" > /proc/sys/kernel/sched_freq_inc_notify
echo "200000" > /proc/sys/kernel/sched_freq_dec_notify
echo "0" > /proc/sys/kernel/softlockup_panic
chmod 0777 /proc/sys/kernel/perf_cpu_time_max_percent
echo "0" > /proc/sys/kernel/perf_cpu_time_max_percent
echo "0" > /proc/sys/kernel/nmi_watchdog
echo "5" > /proc/sys/kernel/sched_walt_init_task_load_pct
echo '1000' > /proc/sys/kernel/sched_freq_aggregate_threshold
echo "2300000" > /sys/module/cpu_boost/parameters/input_boost_freq 
echo "60" > /sys/module/cpu_boost/parameters/input_boost_ms 
echo "140" > /sys/module/cpu_input_boost/parameters/input_boost_duration
echo "2300" > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost_duration 
echo "140" > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost 
chmod 0777 /proc/sys/kernel/sysctl_writes_strict
echo '0' > /proc/sys/kernel/sysctl_writes_strict
chmod 0777 /proc/sys/kernel/sched_tunable_scaling
echo '1' > /proc/sys/kernel/sched_tunable_scaling
echo "0" > /proc/sys/kernel/sched_tunable_scaling
chmod 777 /sys/block/mmcblk0rpmb/queue/scheduler
chmod 777 /sys/block/mmcblk*/queue/scheduler
echo 'deadline' > /sys/block/mmcblk0rpmb/queue/scheduler
echo 'deadline' > /sys/block/mmcblk0/queue/scheduler
echo 'deadline' > /sys/block/mmcblk1/queue/scheduler
echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '1024' > /sys/block/mmcblk1/queue/read_ahead_kb
echo '0-2' > /dev/cpuset/background/cpus;
echo '0-7' > /dev/cpuset/top-app/cpus;
echo '3,4-6,7' > /dev/cpuset/foreground/cpus;
echo '0' >  /dev/stune/foreground/schedtune.boost;
echo '40' > /dev/stune/rt/schedtune.boost;
echo '1' > /dev/stune/nnapi-hal/schedtune.boost;
echo '0-1' > /dev/cpuset/system-background/cpus;
# Top app
echo "70" > /dev/stune/top-app/schedtune.boost
echo "1" > /dev/stune/top-app/schedtune.sched_boost_no_override
echo "70" > /dev/stune/top-app/schedtune.boost
echo "1" > /dev/stune/top-app/schedtune.sched_boost_no_override
echo "5" > /proc/sys/fs/lease-break-time
echo "2048" > /proc/sys/kernel/random/read_wakeup_threshold
echo "2048" > /proc/sys/kernel/random/write_wakeup_threshold

#Desol
for stune in /dev/stune/*; do
  write "0" ${stune}/schedtune.prefer_idle
  write "0" ${stune}/schedtune.colocate
  write "0" ${stune}/cgroup.clone_children
done

for ta in /dev/cpuset/*/top-app
  do
      echo max > "$ta/uclamp.max"
      echo 10 > "$ta/uclamp.min"
      echo 1 > "$ta/uclamp.boosted"
      echo 1 > "$ta/uclamp.latency_sensitive"
  done
  for fd in /dev/cpuset/*/foreground
  do
      echo 50 > "$fd/uclamp.max"
      echo 0 > "$fd/uclamp.min"
      echo 0 > "$fd/uclamp.boosted"
      echo 0 > "$fd/uclamp.latency_sensitive"
  done
  for bd in /dev/cpuset/*/background
  do
      echo max > "$bd/uclamp.max"
      echo 20 > "$bd/uclamp.min"
      echo 0 > "$bd/uclamp.boosted"
      echo 0 > "$bd/uclamp.latency_sensitive"
  done
  for sb in /dev/cpuset/*/system-background
  do
      echo 40 > "$sb/uclamp.max"
      echo 0 > "$sb/uclamp.min"
      echo 0 > "$sb/uclamp.boosted"
      echo 0 > "$sb/uclamp.latency_sensitive"
  done
  sysctl -w kernel.sched_util_clamp_min_rt_default=0
  sysctl -w kernel.sched_util_clamp_min=128
  
# all sd, sda, sdb, etc.
for queue in /sys/block/sd*/queue
  do
      echo "deadline" > "$queue/scheduler"
      echo "0" > "$queue/iostats"
      echo "0" > "$queue/add_random"
      echo "0" > "$queue/nomerges"
      echo "512" > "$queue/nr_requests"
      echo "2" > "$queue/rq_affinity"
      echo "0" > "$queue/rotational"
      echo "1024" > "$queue/read_ahead_kb"
  done

for iosched in /sys/block/sd*/iosched
  do
      echo "0" > "$iosched/slice_idle"
      echo "0" > "$iosched/slice_idle_us"
      echo "0" > "$iosched/group_idle"
      echo "0" > "$iosched/group_idle_us"
  done
for lqueue in /sys/block/loop*/queue
  do
      echo "none" > "$lqueue/scheduler"
      echo "1024" > "$lqueue/read_ahead_kb"
  done 
for liosched in /sys/block/loop*/iosched
  do
      echo "0" > "$liosched/slice_idle"
      echo "0" > "$liosched/slice_idle_us"
  done

#Awol 
sleep 30
echo '-1' > /proc/sys/kernel/sched_rt_runtime_us;
echo '100000' > /proc/sys/kernel/sched_latency_ns;
echo '3' > /proc/sys/vm/drop_caches;
echo '0' > /proc/sys/kernel/sched_wakeup_granularity_ns;
echo '100000' > /proc/sys/kernel/sched_min_granularity_ns;
echo '10000000' > /proc/sys/kernel/sched_migration_cost_ns;
echo '50' > /proc/sys/kernel/sched_nr_migrate;
echo '0' > /proc/sys/kernel/sched_stune_task_threshold
echo '1' > /proc/sys/kernel/sched_time_avg_ms
echo '0' > /proc/sys/kernel/sched_big_task_rotation
echo '0' > /proc/sys/kernel/sched_sync_hint_enable
echo '0' > /proc/sys/kernel/sched_isolation_hint
echo '0' > /proc/sys/kernel/sched_cstate_aware
echo '0' > /proc/sys/kernel/sched_child_runs_first
echo '1' > /proc/sys/kernel/real-root-dev
echo '0' > /proc/sys/kernel/sched_tunable_scaling
echo '200' > /proc/sys/vm/swap_ratio;
echo '4000000' > /proc/sys/kernel/sched_cpu_high_irqload
echo '0' > /proc/sys/kernel/sched_uclamp_util_max
echo '0' > /proc/sys/kernel/sched_uclamp_util_min

