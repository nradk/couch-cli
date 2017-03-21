#!/bin/bash

source includes/utils.sh
source includes/user.sh
source includes/db.sh

# Check if curl is installed
command -v curl > /dev/null 2>&1;
if [ ! $? -eq 0 ]; then
    err "Curl is not installed. Please install it."
    exit 1;
fi

# Check for config file
if [ ! -e config.sh ]; then
    err "Error: config.sh does not exist."
    exit 3;
fi

# Check for config file
if [ ! -f config.sh ]; then
    err "Error: config.sh is a directory when it should be a file."
    exit 4;
fi

source config.sh

if [ "$username" = ""  -o "$password" = "" ]; then
    err "Error: Admin username and/or password is not defined in the config."
    exit 5;
fi

# If host is not defined, use localhost
if [ "$dbhost" = "" ]; then
    dbhost=localhost
fi

# If port is not defined, used 5984
if [ "$dbport" = "" ]; then
    dbhost=5984
fi

# Check if couchdb is running
curl $dbhost:$dbport > /dev/null 2>&1;
if [ ! $? -eq 0 ]; then
    err "CouchDB is not running on $dbhost:$dbport"
    exit 2;
fi

# Examine first argument and dispatch handler if we can
if [ -z $1 ]; then
    err "Error: no command provided."
    exit 6;
fi

if [ "$1" = "db" ]; then
    db $@
elif [ "$1" = "user" ]; then
    user $@
else
    err "$1 is not an emrcouch command."
    exit 7;
fi
