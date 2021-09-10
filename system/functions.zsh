key() {
    if [ ! -f ~/.ssh/id_rsa.pub ]
    then
        ssh-keygen
    fi

    cat ~/.ssh/id_rsa.pub
}
