#!/bin/bash
EXPECTED_ARGS=1
if [ $# -ne $EXPECTED_ARGS ]; then
    echo "Usage: $(basename $0) log_file"
    exit 1
fi
LOGFILE=$1

# Load all instances of user agents from log file
AGENTS=$(cat $LOGFILE | rev | cut -d " " -f 1 | rev)
# Determine unique user agents
UNIQUE_AGENTS=$(echo "$AGENTS" | sort | uniq)
# Count instance of each unique user agent and display top 10
while read -r agent; do
    count=$(echo "$AGENTS" | grep $agent | wc -l)
    echo "$agent,$count"
done <<< "$UNIQUE_AGENTS" | sort -t, -k2 -r | head -n 10




