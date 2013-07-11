epel:
  cmd.run:
    - name: 'rpm -Uvh http://fr2.rpmfind.net/linux/epel/6/x86_64/epel-release-6-8.noarch.rpm'
    - cwd: /
    - user: root
    - unless: 'rpm -q epel-release-6-8.noarch'
