function err {
    >&2 echo $@
}

function check_name_exists {
    if [ -z $1 ]; then
        return 1;
    else
        return 0;
    fi
}

function check_names_exist {
    if [ -z $1 -o -z $2 ]; then
        return 1;
    else
        return 0;
    fi
}
