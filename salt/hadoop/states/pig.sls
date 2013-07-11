include:
  - hadoop.states.basepackages

hadoop-pig:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-hbase

{{ pillar['hadoop']['pig_base_dir'] }}:
  file.directory:
    - user: hdfs
    - group: hadoop
    - mode: 777
{{ pillar['hadoop']['pig_log_dir'] }}:
  file.directory:
    - user: hdfs
    - group: hadoop
    - mode: 777
    - require:
      - file.directory: {{ pillar['hadoop']['pig_base_dir'] }}

/etc/profile:
  file.managed:
    - source: salt://hadoop/templates/profile
    - template: jinja
    - user: root
    - group: root
    - mode: 644
pig.properties:
  file.managed:
    - name: '/etc/pig/conf/pig.properties'
    - source: salt://hadoop/templates/pig.properties
    - template: jinja
    - user: hdfs
    - group: hadoop
    - mode: 644
    - require:
      - pkg.installed: hadoop-pig
