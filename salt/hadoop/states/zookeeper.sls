include:
  - hadoop.states.basepackages

hadoop-zookeeper:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20

zoo.cfg:
  file.managed:
    - name: '/etc/zookeeper/zoo.cfg'
    - source: salt://hadoop/templates/zoo.cfg
    - template: jinja
    - user: zookeeper
    - group: zookeeper
    - mode: 644
    - require:
      - pkg.installed: hadoop-zookeeper
