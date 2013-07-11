include:
  - hadoop.states.basepackages

oozie:
  pkg.installed:
    - require:
      - pkg.installed: hadoop-0.20
  service:
    - running
    - enable: True
    - require:
      - pkg.installed: oozie
      - cmd.run: ext-2.2.zip
zip:
  pkg.installed

ext-2.2.zip:
  file.managed:
    - name: '/srv/sync/hadoop/ext-2.2.zip'
    - source: salt://hadoop/files/ext-2.2.zip
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: 'sudo -u oozie /usr/lib/oozie/bin/oozie-setup.sh -extjs ext-2.2.zip'
    - cwd: /srv/sync/hadoop/
    - user: root
    - unless: 'test -e /var/lib/oozie/oozie-server/webapps/oozie.war'
    - require:
      - file.managed: ext-2.2.zip
      - pkg.installed: oozie
      - pkg.installed: zip
