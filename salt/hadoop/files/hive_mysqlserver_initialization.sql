CREATE DATABASE metastore;
USE metastore;
SOURCE /usr/lib/hive/scripts/metastore/upgrade/mysql/hive-schema-0.7.0.mysql.sql;

CREATE USER '{{ pillar['hadoop']['hive_user'] }}'@'%' IDENTIFIED BY '{{ pillar['hadoop']['hive_password'] }}';
GRANT SELECT,INSERT,UPDATE,DELETE ON metastore.* TO '{{ pillar['hadoop']['hive_user'] }}'@'%';
REVOKE ALTER,CREATE ON metastore.* FROM '{{ pillar['hadoop']['hive_user'] }}'@'%';
CREATE USER '{{ pillar['hadoop']['hive_user'] }}'@'localhost' IDENTIFIED BY '{{ pillar['hadoop']['hive_password'] }}';
GRANT SELECT,INSERT,UPDATE,DELETE ON metastore.* TO '{{ pillar['hadoop']['hive_user'] }}'@'localhost';
REVOKE ALTER,CREATE ON metastore.* FROM '{{ pillar['hadoop']['hive_user'] }}'@'localhost';
CREATE USER '{{ pillar['hadoop']['hive_user'] }}'@'{{ pillar['hadoop']['hive_server'] }}' IDENTIFIED BY '{{ pillar['hadoop']['hive_password'] }}';
GRANT SELECT,INSERT,UPDATE,DELETE ON metastore.* TO '{{ pillar['hadoop']['hive_user'] }}'@'{{ pillar['hadoop']['hive_server'] }}';
REVOKE ALTER,CREATE ON metastore.* FROM '{{ pillar['hadoop']['hive_user'] }}'@'{{ pillar['hadoop']['hive_server'] }}';
