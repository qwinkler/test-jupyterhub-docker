#!/bin/bash

NB_UID=`id -u`
NB_GID=`id -g`

if [ $NB_GID -eq 0 -a $NB_UID -ge 100000 ]; then
    cat /etc/passwd | sed -e "s/^jovyan:/nayvoj:/" > /tmp/passwd
    echo "jovyan:x:$NB_UID:$NB_GID:,,,:/home/jovyan:/bin/bash" >> /tmp/passwd
    cat /tmp/passwd > /etc/passwd
    rm /tmp/passwd

    id -G | grep -q -w $NB_UID; STATUS=$?
    if [ $STATUS -eq 0 ]; then
        echo "jovyan:x:$NB_UID:" >> /etc/group
    fi
fi
