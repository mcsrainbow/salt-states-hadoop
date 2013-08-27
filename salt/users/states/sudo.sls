/etc/sudoers:
  file.managed:
    - source: salt://users/files/sudoers
    - user: root
    - user: root
    - mode: 440
