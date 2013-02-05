#!/bin/bash
sha=$(git ls-remote git://github.com/Webconverger/webc.git refs/heads/master)
grep ${sha:0:6} /srv/www/ping.webconverger.org/debug.log | awk '{print $NF}' | sort -u | wc -l
