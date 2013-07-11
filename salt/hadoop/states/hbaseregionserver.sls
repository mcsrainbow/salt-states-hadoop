include:
  - hadoop.states.hbasecommon

hadoop-hbase-regionserver:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-hbase-regionserver
