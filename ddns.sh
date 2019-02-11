#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : ddns.sh
#
# [] Creation Date : 11-02-2019
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================
while true; do
        date
        curl -#L http://ifconfig.io/ip | tee ip.address
        sleep 3600
done
