replace_env() {
    cat ${ENVFILE-.env} | grep -v "${1}=" > /tmp/.env
    echo "${1}=${2}" >> /tmp/.env

    mv /tmp/.env ${ENVFILE-.env}
}

crabinit() {
    PROJECT_NAME="$(basename $PWD)"

    replace_env VIRTUAL_HOST "${PROJECT_NAME}.localhost"
    replace_env SITE_URL "http://${PROJECT_NAME}.localhost"
}
