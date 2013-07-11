include:
  - hadoop.states.basepackages

hadoop-hbase:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20

hbase-env.sh:
  file.managed:
    - name: '/etc/hbase/conf/hbase-env.sh'
    - source: salt://hadoop/templates/hbase-env.sh
    - template: jinja
    - user: hbase
    - group: hbase
    - mode: 755
    - require:
      - pkg.installed: hadoop-hbase
hbase-site.xml:
  file.managed:
    - name: '/etc/hbase/conf/hbase-site.xml'
    - source: salt://hadoop/templates/hbase-site.xml
    - template: jinja
    - user: hbase
    - group: hbase
    - mode: 644
    - require:
      - pkg.installed: hadoop-hbase

limits.conf:
  file.managed:
    - name: '/etc/security/limits.conf'
    - source: salt://hadoop/files/limits.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg.installed: hadoop-hbase

{{ pillar['hadoop']['hbase_base_dir'] }}:
  file.directory:
    - user: hbase
    - group: hbase
    - mode: 755
    - require:
      - pkg.installed: hadoop-hbase
{{ pillar['hadoop']['hbase_log_dir'] }}:
  file.directory:
    - user: hbase
    - group: hbase
    - mode: 755
    - require:
      - file.directory: {{ pillar['hadoop']['hbase_base_dir'] }}
