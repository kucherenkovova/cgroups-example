sudo cgcreate -g cpu:/cpulimit

sudo cgset -r cpu.cfs_quota_us=150000 cpulimit
sudo cgset -r cpu.cfs_period_us=1000000 cpulimit

sudo cgcreate -g cpuset:/corelimit

sudo cgset -r cpuset.cpus=1 corelimit
sudo cgset -r cpuset.mems=0 corelimit

sudo cgexec -g cpuset:corelimit -g cpu:cpulimit ./app