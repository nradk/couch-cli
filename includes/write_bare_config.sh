function write_bare_config {
    touch config.sh
    echo 'username=""' >> config.sh
    echo 'password=""' >> config.sh
    echo 'dbhost=""' >> config.sh
    echo 'dbport=""' >> config.sh
}
