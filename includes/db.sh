source includes/utils.sh

function check_name_exists {
    if [ -z $1 ]; then
        return 1;
    else
        return 0;
    fi
}

function db {
    if [ -z $2 ]; then
        err "Error: no sub-command provided for the db command."
        exit;
    fi

    if [ "$2" = "list" ]; then
        curl $dbhost:5984/_all_dbs
    elif [ "$2" = "docs" -o "$2" = "create" -o "$2" = "delete" ]; then
        check_name_exists $3
        if [ $? -eq 0 ]; then
            if [ $2 = "docs" ]; then
                curl $dbhost:5984/$3/_all_docs
            elif [ $2 = "create" ]; then
                curl -XPUT $username:$password@$dbhost:5984/$3
            elif [ $2 = "delete" ]; then
                curl -XDELETE $username:$password@$dbhost:5984/$3
            fi;
        else
            err "Error: Please provide the name of the database."
        fi
    else
        err "$2 is not a db subcommand."
    fi;
}
