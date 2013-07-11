cloudera-cdh3u6.repo:
  file.managed:
    - name: '/etc/yum.repos.d/cloudera-cdh3u6.repo'
    - source: salt://hadoop/files/cloudera-cdh3u6.repo
    - user: root
    - group: root
    - mode: 644
    - require:
      - cmd.run: epel

/srv/sync/hadoop:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require:
      - file.directory: /srv/sync

jdk:
  file.managed:
    - name: '/srv/sync/hadoop/jdk-6u41-linux-amd64.rpm'
    - source: salt://hadoop/files/jdk-6u41-linux-amd64.rpm
    - user: root
    - group: root
    - mode: 644
    - require:
      - file.directory: /srv/sync/hadoop
  cmd.run:
    - name: 'rpm -Uvh /srv/sync/hadoop/jdk-6u41-linux-amd64.rpm'
    - cwd: /
    - user: root
    - unless: 'rpm -q jdk-1.6.0_41-fcs'
    - require:
      - file.managed: jdk

hadoop-0.20:
  pkg.installed:
    - require:
      - file.managed: cloudera-cdh3u6.repo

{{ pillar['hadoop']['hadoop_base_dir'] }}:
  file.directory:
    - user: hdfs
    - group: hadoop
    - mode: 775
    - makedirs: True
    - require:
      - pkg.installed: hadoop-0.20
{{ pillar['hadoop']['dfs_data_dir'] }}:
  file.directory:
    - user: hdfs
    - group: hadoop
    - mode: 700
    - makedirs: True
    - require:
      - file.directory: {{ pillar['hadoop']['hadoop_base_dir'] }}
{{ pillar['hadoop']['hadoop_tmp_base_dir'] }}:
  file.directory:
    - user: hdfs
    - group: hadoop
    - mode: 1777
    - makedirs: True
    - require:
      - file.directory: {{ pillar['hadoop']['hadoop_base_dir'] }}
{{ pillar['hadoop']['hadoop_log_dir'] }}:
  file.directory:
    - user: hdfs
    - group: hadoop
    - mode: 775
    - makedirs: True
    - require:
      - pkg.installed: hadoop-0.20

hadoop-env.sh:
  file.managed:
    - name: '/etc/hadoop/conf/hadoop-env.sh'
    - source: salt://hadoop/templates/hadoop-env.sh
    - template: jinja
    - user: hdfs
    - group: hadoop
    - mode: 755
    - require:
      - pkg.installed: hadoop-0.20
core-site.xml:
  file.managed:
    - name: '/etc/hadoop/conf/core-site.xml'
    - source: salt://hadoop/templates/core-site.xml
    - template: jinja
    - user: hdfs
    - group: hadoop
    - mode: 644
    - require:
      - pkg.installed: hadoop-0.20
hdfs-site.xml:
  file.managed:
    - name: '/etc/hadoop/conf/hdfs-site.xml'
    - source: salt://hadoop/templates/hdfs-site.xml
    - template: jinja
    - user: hdfs
    - group: hadoop
    - mode: 644
    - require:
      - pkg.installed: hadoop-0.20
mapred-site.xml:
  file.managed:
    - name: '/etc/hadoop/conf/mapred-site.xml'
    - source: salt://hadoop/templates/mapred-site.xml
    - template: jinja
    - user: hdfs
    - group: hadoop
    - mode: 644
    - require:
      - pkg.installed: hadoop-0.20
