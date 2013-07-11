base:
  '*':
    - users.states.create
    - common.states.epel
    - common.states.syncdir

  'symbio1.heylinux.com':
    - hadoop.states.namenode
    - hadoop.states.hbasemaster

  'symbio2.heylinux.com':
    - hadoop.states.secondarynamenode
    - hadoop.states.jobtracker
    - hadoop.states.hiveserver
    - hadoop.states.pig
    - hadoop.states.oozie
    - hadoop.states.sqoop
  
  'symbio[1-3].heylinux.com':
    - hadoop.states.zookeeperserver

  'symbio[3,5-7].heylinux.com':
    - hadoop.states.datanode
    - hadoop.states.tasktracker
    - hadoop.states.hbaseregionserver
