include:
  - hadoop.states.hive

hadoop-hive-metastore:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-hive
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-hive-metastore
hadoop-hive-server:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-hive
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-hive-server
mysql-server:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-hive-metastore
  service:
    - name: mysqld
    - running
    - enable: True
    - require:
      - pkg.installed: mysql-server

/var/lib/hive:
  file.directory:
    - user: hive
    - group: hive
    - mode: 755
    - require:
      - pkg.installed: hadoop-hive
/var/lib/hive/metastore:
  file.directory:
    - user: hive
    - group: hive
    - mode: 755
    - require:
      - file.directory: /var/lib/hive

hive_mysqlserver_initialization.sql:
  file.managed:
    - name: '/srv/sync/hadoop/hive_mysqlserver_initialization.sql'
    - source: salt://hadoop/files/hive_mysqlserver_initialization.sql
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg.installed: hadoop-hive-metastore
hive_initialization.sh:
  file.managed:
    - name: '/srv/sync/hadoop/hive_initialization.sh'
    - source: salt://hadoop/files/hive_initialization.sh
    - template: jinja
    - user: root
    - group: root
    - mode: 755
    - require:
      - pkg.installed: mysql-server
  cmd.run:
    - name: '/bin/sh hive_initialization.sh'
    - cwd: /srv/sync/hadoop/
    - user: root
    - unless: 'sudo -u hdfs hadoop fs -test -e /user/hive'
    - require:
      - file.managed: hive_initialization.sh
