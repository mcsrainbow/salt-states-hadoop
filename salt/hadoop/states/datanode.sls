include:
  - hadoop.states.basepackages

hadoop-0.20-datanode:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-0.20-datanode
