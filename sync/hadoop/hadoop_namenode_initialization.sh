#!/bin/bash
#File Managed by Salt

function check_root()
{
    if [ $EUID -ne 0 ]; then
        echo "This script must be run as root" 1>&2
        exit 1
    fi
}

function format_namenode()
{
    check_root

    DATA_DIR=/data/hadoop/tmp
    
    if [ ! -d $DATA_DIR ]; then
        echo "The hadop.tmp.dir: $DATA_DIR/hadoop-hdfs dose not exist."
        exit 0
    fi

    if [ -f $DATA_DIR/hadoop-hdfs/dfs/name/current/VERSION ]; then
        echo "The namenode has already been formatted."
        exit 0
    else 
        echo "Format the HDFS on Namenode"
        sudo -u hdfs hadoop namenode -format
        
        echo "Start the namenode service"
        sudo /etc/init.d/hadoop-0.20-namenode start 
    fi
}

function create_dirs()
{
    echo "Create the directories for Map-Reduce"
    sudo -u hdfs hadoop fs -mkdir /mapred/system
    sudo -u hdfs hadoop fs -chown mapred:hadoop /mapred/system
}

format_namenode
create_dirs
