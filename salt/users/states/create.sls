{% for user, uid in pillar.get('users', {}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
/home/{{user}}/.bashrc:
  file.managed:
    - source: salt://users/files/bashrc
    - user: {{user}}
    - group: {{user}}
    - mode: 644
{% endfor %}
