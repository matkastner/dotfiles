set_env() {
    cat ${ENVFILE-.env} | grep -v "${1}=" > /tmp/.env
    echo "${1}=${2}" >> /tmp/.env

    mv /tmp/.env ${ENVFILE-.env}
}

crabinit() {
    PROJECT_NAME="$(basename $PWD)"

    set_env VIRTUAL_HOST "${PROJECT_NAME}.localhost"
    set_env SITE_URL "http://${PROJECT_NAME}.localhost"
}
