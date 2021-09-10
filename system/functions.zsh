key() {
    if [ ! -f ~/.ssh/id_rsa.pub ]
    then
        ssh-keygen
        echo
    fi

    cat ~/.ssh/id_rsa.pub
    echo "$(cat ~/.ssh/id_rsa.pub)" | pbcopy

    if [ "${1}" = "setup" ]
    then
        open https://github.com/settings/ssh/new
        echo
        echo "Paste the key into the box in github and press Add SSH key to complete setup."
    fi
}
