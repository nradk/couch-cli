#!/bin/bash

source includes/utils.sh
source includes/db.sh

# Check if curl is installed
command -v curl > /dev/null 2>&1;
if [ ! $? -eq 0 ]; then
    err "Curl is not installed. Please install it."
    exit 1;
fi

# Check if couchdb is running
curl 127.0.0.1:5984 > /dev/null 2>&1;
if [ ! $? -eq 0 ]; then
    err "CouchDB is not running on port 5984."
    exit 2;
fi

# Examine first argument and dispatch handler if we can
if [ -z $1 ]; then
    err "Error: no command provided."
    exit 3;
fi

if [ "$1" = "db" ]; then
    db $@
else
    err "$1 is not an emrcouch command."
fi
