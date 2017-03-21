# EMRCOUCH
`emrcouch` is a helper script to simplify manipulation of the CouchDB backend
database used by the BTF EMR project.

## Configuring the script
- Ensure that CouchDB is not in the admin party, i.e. make sure admin name and
  password have been set. Then, put those values in the `config.sh` file:
    
    ```
    username=foo
    password=bar
    ```


## Usage
First, you need to ensure that CouchDB is running is lisetening on the local
machine on port 5984.

#### Databases
- List all databases
    
    `./emrcouch db list`

- List all documents of a database

    `./emrcouch db docs <name>`

- Create a database:

    `./emrcouch db create <name>`

- Delete a database

    `./emrcouch db delete <name>`


### Users
- List all users
    
    `./emrcouch user list`

- Create a user with given username and password
    
    `./emrcouch user create <username> <password>`

- Remove the user with the given username

    `./emrcouch user delete <username>`
