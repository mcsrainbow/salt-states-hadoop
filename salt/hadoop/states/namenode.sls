include:
  - hadoop.states.basepackages

hadoop-0.20-namenode:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: hadoop-0.20-namenode

hadoop_namenode_initialization.sh:
  file.managed:
    - name: '/srv/sync/hadoop/hadoop_namenode_initialization.sh'
    - source: salt://hadoop/files/hadoop_namenode_initialization.sh
    - template: jinja
    - user: root
    - group: root
    - mode: 755
    - require:
      - service: hadoop-0.20-namenode
  cmd.run:
    - name: '/bin/sh hadoop_namenode_initialization.sh'
    - cwd: /srv/sync/hadoop/
    - user: root
    - unless: 'test -e {{ pillar['hadoop']['hadoop_tmp_base_dir']}}/hadoop-hdfs/dfs/name/current/VERSION'
    - require:
      - file.managed: hadoop_namenode_initialization.sh
