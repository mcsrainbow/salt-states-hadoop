hadoop:
  # Namenode
  namenode: ip-10-197-31-234.us-west-1.compute.internal
  secondarynamenode: ip-10-197-34-238.us-west-1.compute.internal
  # HDFS
  hadoop_base_dir: /mnt/disk1/hadoop
  hadoop_tmp_base_dir: /mnt/disk1/hadoop/tmp
  hadoop_tmp_dir: /mnt/disk1/hadoop/tmp/hadoop-${user.name}
  dfs_data_dir: /mnt/disk1/hadoop/hdfs
  dfs_replication: 3
  hadoop_log_dir: /mnt/disk1/hadoop/logs
  # JobTracker
  mapred_job_tracker: ip-10-197-34-238.us-west-1.compute.internal
  mapred_system_dir: /mapred/system
  mapreduce_jobtracker_staging_root_dir: /user
  # JDK
  java_home: /usr/java/jdk1.6.0_41
  # Zookeeper
  zookeeper_quorum: 
    ip-10-197-31-234.us-west-1.compute.internal
    ip-10-197-34-238.us-west-1.compute.internal
    ip-10-197-56-62.us-west-1.compute.internal
  zookeeper_datadir: /mnt/disk1/zookeeper
  # Hive
  hive_server: ip-10-197-34-238.us-west-1.compute.internal
  hive_user: hiveuser
  hive_password: password
  hive_root_password: hadoophive
  # HBase
  hbase_log_dir: /mnt/disk1/hbase/logs
  hbase_base_dir: /mnt/disk1/hbase
  # Pig
  pig_log_dir: /mnt/disk1/pig/logs
  pig_base_dir: /mnt/disk1/pig
  pig_log_file: /mnt/disk1/pig/logs/pig.log
zookeeper_quorum_myid:
  ip-10-197-31-234.us-west-1.compute.internal: 1
  ip-10-197-34-238.us-west-1.compute.internal: 2
  ip-10-197-56-62.us-west-1.compute.internal: 3
