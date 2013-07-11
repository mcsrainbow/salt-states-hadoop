#!/bin/bash
#File Managed by Salt

function check_hdfs()
{
    sudo -u hdfs hadoop fs -test -e /
    if [ $? -ne 0 ]; then
        echo "HDFS is not available."
        exit 1
    fi
}

function create_dirs()
{
    check_hdfs

    sudo -u hdfs hadoop fs -test -e /user/hive
    if [ $? -eq 0 ]; then
        echo "/user/hive already exists."
        exit 0
    else
        echo "Create the directories on HDFS"
        sudo -u hdfs hadoop fs -mkdir /user/hive
        sudo -u hdfs hadoop fs -chown hive /user/hive
        sudo -u hdfs hadoop fs -mkdir /tmp
        sudo -u hdfs hadoop fs -chmod 777 /tmp
        sudo -u hdfs hadoop fs -chmod o+t /tmp
        sudo -u hdfs hadoop fs -mkdir /data
        sudo -u hdfs hadoop fs -chown hdfs /data
        sudo -u hdfs hadoop fs -chmod 777 /data
        sudo -u hdfs hadoop fs -chmod o+t /data
    fi
}

function configure_mysql()
{
    echo "Start MySQL"
    sudo /etc/init.d/mysqld start

    echo "Reset the password for MySQL"
    mysqladmin -u root password '{{ pillar['hadoop']['hive_root_password'] }}'

    echo "Create the database for metastore"
    mysql -uroot -p{{ pillar['hadoop']['hive_root_password'] }} < /srv/sync/hadoop/hive_mysqlserver_initialization.sql
}

create_dirs
configure_mysql
