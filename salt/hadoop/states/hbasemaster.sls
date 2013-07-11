include:
  - hadoop.states.hbasecommon

hadoop-hbase-master:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-hbase-master
hadoop-hbase-thrift:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-hbase-thrift

hbasemaster_initialization.sh:
  file.managed:
    - name: '/srv/sync/hadoop/hbasemaster_initialization.sh'
    - source: salt://hadoop/files/hbasemaster_initialization.sh
    - template: jinja
    - user: root
    - group: root
    - mode: 755
    - require:
      - service: hadoop-hbase-master
  cmd.run:
    - name: '/bin/sh hbasemaster_initialization.sh'
    - cwd: /srv/sync/hadoop/
    - user: root
    - unless: 'sudo -u hdfs hadoop fs -test -e /hbase'
    - require:
      - file.managed: hbasemaster_initialization.sh
