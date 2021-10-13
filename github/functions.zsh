get_repos() {
    if ! gh auth status
    then
        gh auth login
    fi

    curr_dir=$pwd

    mkdir -p ~/Code/dabapps

    search="$(echo "${1}" | tr '[:upper:]' '[:lower:]')"

    for repo in $(gh repo list dabapps -L 500 --json name -q ".[].name | select(contains(\"${search}\"))")
    do
        cd ~/Code/dabapps

        if [ -d ${repo} ]
        then
            echo "Skipping ${repo}..."
        else
            echo "Cloning ${repo}..."
            gh repo clone dabapps/${repo}
        fi

        cd ${repo}
        echo 16 > .nvmrc
        nvm install && npm install

        if [ -d ios ]
        then
            npm install pod-install --save-dev
            npx pod-install
        fi
    done

    cd $curr_dir
}
