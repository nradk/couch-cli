# EMRCOUCH

`emrcouch` is a helper script to simplify manipulation of the CouchDB backend
database used by the BTF EMR project.

## Usage

First, you need to ensure that CouchDB is running is lisetening on the local
machine on port 5984.

### Databases

- List all databases
    
    `./emrcouch db list`

- List all documents of a database

    `./emrcouch db docs <name>`

- Create a database:

    `./emrcouch db create <name>`

- Delete a database

    `./emrcouch db delete <name>`
