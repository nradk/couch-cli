function usage() {
    echo "Usage: $0 <command> <subcommand> [<parameters>..]"
    echo
    echo "The list of all commands, their subcommands and usage is "

    echo "$0 db list                                List all databases"
    echo "$0 db docs <name>                         List all documents of a database"
    echo "$0 db create <name>                       Create a database"
    echo "$0 db delete <name>                       Delete a database"

    echo "$0 user list                              List all users"
    echo "$0 user create <username> <password>      Create a user with given username and password"
    echo "$0 user delete <username>                 Remove the user with the given username"

}
