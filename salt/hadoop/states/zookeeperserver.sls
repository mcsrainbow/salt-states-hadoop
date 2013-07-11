include:
  - hadoop.states.zookeeper

hadoop-zookeeper-server:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-zookeeper-server

{{ pillar['hadoop']['zookeeper_datadir'] }}:
  file.directory:
    - user: zookeeper
    - group: zookeeper
    - mode: 755
    - require:
      - pkg.installed: hadoop-zookeeper-server
{{ pillar['hadoop']['zookeeper_datadir'] }}/myid:
  file.managed:
    - source: salt://hadoop/templates/myid
    - template: jinja
    - user: zookeeper
    - group: zookeeper
    - mode: 644
    - require:
      - file.directory: {{ pillar['hadoop']['zookeeper_datadir'] }}
