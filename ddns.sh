#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : ddns.sh
#
# [] Creation Date : 11-02-2019
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

# start.sh
program_name=$0
tmpfile=""

trap '_end' INT
_end() {
        if [ $tmpfile ]; then
                echo "removes $tmpfile"
                rm $tmpfile
        fi
        echo "See you later :) [you signal start.sh execuation]"
        exit
}

_usage() {
        echo "usage: $program_name [-h] [-r]"
        echo "  -h   display help"
        echo "  -r   repository that is used for commiting ip addresses"
}

main() {
        # parses options flags
        while getopts 'hr:' argv; do
                case $argv in
                        h)
                                _usage
                                exit 0
                                ;;
                        r)
                                repository=$OPTARG
                                ;;
                esac
        done

        if [ ! $repository ]; then
                echo "Please specify the commiting repository"
                exit 1
        fi

        tmpfile=$(mktemp)
        while true; do
                date
                curl -#L http://ifconfig.io/ip | tee $tmpfile
                if [ $? -eq 0 ]; then
                        echo "CURL executed successfully"
                        cp $tmpfile "$repository/ip.address"
                fi
                git -C $repository add ip.address
                git -C $repository commit -m "Updates IP address"
                git -C $repository push origin master
                sleep 3600
        done
}

main $@
