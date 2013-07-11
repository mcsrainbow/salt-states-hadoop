#!/bin/sh

BLACKLIST=(
"rm"
"shutdown"
"poweroff"
"reboot"
"init"
"mkfs"
"sudo"
)

echo -ne "\033[32mExecute the command as root on all minions: \033[0m"
read COMMAND
echo "..."

COMMAND_PREFIX=`echo ${COMMAND} | awk '{print $1}'`

for BLACKLISTED_COMMAND in ${BLACKLIST[@]} ; do
    if [ "${BLACKLISTED_COMMAND}" == "${COMMAND_PREFIX}" ] ; then
        echo -e "\033[31mSorry! The command \033[33m\"${COMMAND_PREFIX}\"\033[31m is blacklisted. \033[0m"
        exit 1
    fi
done

sudo salt '*' cmd.run "${COMMAND}"
