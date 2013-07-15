include:
  - hadoop.states.basepackages
  - hadoop.states.hbasecommon
  - hadoop.states.zookeeper

hadoop-hive:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-hbase

hive-site.xml:
  file.managed:
    - name: '/etc/hive/conf/hive-site.xml'
    - source: salt://hadoop/templates/hive-site.xml
    - template: jinja
    - user: hive
    - group: hive
    - mode: 644
    - require:
      - pkg.installed: hadoop-hive
mysql-connector-java-5.1.24-bin.jar:
  file.managed:
    - name: '/usr/lib/hive/lib/mysql-connector-java-5.1.24-bin.jar'
    - source: salt://hadoop/files/mysql-connector-java-5.1.24-bin.jar
    - user: hive
    - group: hive
    - mode: 644
    - require:
      - pkg.installed: hadoop-hive
hbase-0.90.6-cdh3u6.jar:
  file.managed:
    - name: '/usr/lib/hive/lib/hbase-0.90.6-cdh3u6.jar'
    - source: salt://hadoop/files/hbase-0.90.6-cdh3u6.jar
    - user: hive
    - group: hive
    - mode: 644
    - require:
      - pkg.installed: hadoop-hive
zookeeper-3.3.5-cdh3u6.jar:
  file.managed:
    - name: '/usr/lib/hive/lib/zookeeper-3.3.5-cdh3u6.jar'
    - source: salt://hadoop/files/zookeeper-3.3.5-cdh3u6.jar
    - user: hive
    - group: hive
    - mode: 644
    - require:
      - pkg.installed: hadoop-hive
