# COUCH-CLI
`couch-cli` is a helper script to simplify manipulation of a CouchDB database
database through the command line.

## Configuring the script
- Ensure that CouchDB is not in the admin party, i.e. make sure admin name and
  password have been set. Then, put those values in the `config.sh` file. You
  can set the database host and port too. If you don't set them, the default
  used is `localhost:5984`.
    
    ```
    username=foo
    password=bar
    dbhost=localhost
    dbport=5984
    ```


## Usage
First, you need to ensure that CouchDB is running and is listening on the
given host and port (`localhost:5984` if you haven't specified anything).

#### Databases
- List all databases
    
    `./couch-cli.sh db list`

- List all documents of a database

    `./couch-cli.sh db docs <name>`

- Create a database:

    `./couch-cli.sh db create <name>`

- Delete a database

    `./couch-cli.sh db delete <name>`


### Users
- List all users
    
    `./couch-cli.sh user list`

- Create a user with given username and password
    
    `./couch-cli.sh user create <username> <password>`

- Remove the user with the given username

    `./couch-cli.sh user delete <username>`
