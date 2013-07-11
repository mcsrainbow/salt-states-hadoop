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

    sudo -u hdfs hadoop fs -test -e /hbase
    if [ $? -eq 0 ]; then
        echo "/hbase already exists."
    else
        echo "Create the directories on HDFS"
        sudo -u hdfs hadoop fs -mkdir /hbase
        sudo -u hdfs hadoop fs -chown hbase /hbase
    fi
}

create_dirs
