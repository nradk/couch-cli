source includes/utils.sh

function getRev {
    curl -s $username:$password@$dbhost:$dbport/_users/org.couchdb.user:$1 \ |\
        tr -d \" | tr , "\n" | grep _rev | sed -r "s/_rev:([[:alnum:]\-]+)/\1/g"
}

function user {
    if [ -z $2 ]; then
        err "Error: no sub-command provided for the user command."
        exit;
    fi

    if [ "$2" = "list" ]; then
        curl "$username:$password@$dbhost:$dbport/_users/_all_docs?descending=true&endkey=\"_design0\""
    elif [ "$2" = "create" ]; then
        check_names_exist $3 $4
        if [ $? -eq 0 ]; then
            curl -XPOST $username:$password@$dbhost:$dbport/_users \
                -H "Content-Type:application/json"\
                -d "{\"_id\":\"org.couchdb.user:$3\",\"name\":\"$3\",\
                     \"type\":\"user\",\"roles\":[],\"password\":\"$4\"}"
        else
            err "Error: Please provide both the username and the password."
        fi
    elif [ "$2" = "delete" ]; then
        check_name_exists $3
        if [ $? -eq 0 ]; then
            docrev=$(getRev $3)
            curl -XDELETE $username:$password@$dbhost:$dbport/_users/org.couchdb.user:$3?rev=$docrev
        else
            err "Error: Please provide the name of the user."
        fi
    else
        err "$2 is not a user subcommand."
    fi;
}
