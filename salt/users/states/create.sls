{% for user, uid in pillar.get('users', {}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
    - gid: 4
    - groups:
      - adm
/home/{{user}}/.bashrc:
  file.managed:
    - source: salt://users/files/bashrc
    - user: {{user}}
    - mode: 644
{% endfor %}
