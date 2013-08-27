hadoop:
  # Namenode
  namenode: demoenv-master
  secondarynamenode: demoenv-secondary
  # HDFS
  hadoop_base_dir: /data/hadoop
  hadoop_tmp_base_dir: /data/hadoop/tmp
  hadoop_tmp_dir: /data/hadoop/tmp/hadoop-${user.name}
  dfs_data_dir: /data/hadoop/hdfs
  dfs_replication: 3
  hadoop_log_dir: /data/hadoop/logs
  # JobTracker
  mapred_job_tracker: demoenv-secondary
  mapred_system_dir: /mapred/system
  mapreduce_jobtracker_staging_root_dir: /user
  # JDK
  java_home: /usr/java/jdk1.6.0_41
  # Zookeeper
  zookeeper_quorum: 
    demoenv-node-1
    demoenv-node-2
    demoenv-node-3
  zookeeper_datadir: /data/zookeeper
  # Hive
  hive_server: demoenv-secondary
  hive_user: hiveuser
  hive_password: password
  hive_root_password: hadoophive
  # HBase
  hbase_log_dir: /data/hbase/logs
  hbase_base_dir: /data/hbase
  # Pig
  pig_log_dir: /data/pig/logs
  pig_base_dir: /data/pig
  pig_log_file: /data/pig/logs/pig.log
zookeeper_quorum_myid:
  demoenv-node-1: 1
  demoenv-node-2: 2
  demoenv-node-3: 3
