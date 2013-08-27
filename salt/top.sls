base:
  '*':
    - users.states.create
    - users.states.sudo
    - common.states.epel
    - common.states.syncdir
    - common.states.hosts

  'demoenv-master':
    - hadoop.states.namenode
    - hadoop.states.hbasemaster

  'demoenv-secondary':
    - hadoop.states.secondarynamenode
    - hadoop.states.jobtracker
    - hadoop.states.hiveserver
    - hadoop.states.pig
    - hadoop.states.oozie
    - hadoop.states.sqoop
  
  'demoenv-node-[1-3]':
    - hadoop.states.zookeeperserver
    - hadoop.states.datanode
    - hadoop.states.tasktracker
    - hadoop.states.hbaseregionserver
