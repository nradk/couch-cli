function usage() {
    cat << EOF

Usage: $0 <command> <subcommand> [<parameters>..]

The list of all commands, their subcommands and usage is 
$0 db list                                List all databases
$0 db docs <name>                         List all documents of a database
$0 db create <name>                       Create a database
$0 db delete <name>                       Delete a database
$0 user list                              List all users
$0 user create <username> <password>      Create a user with given username and password
$0 user delete <username>                 Remove the user with the given username
EOF
}
