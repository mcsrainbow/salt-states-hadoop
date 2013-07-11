include:
  - hadoop.states.basepackages
  - hadoop.states.hbasecommon

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
