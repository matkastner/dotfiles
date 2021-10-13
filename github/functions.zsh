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
        nvm install && npm install
    done

    cd $curr_dir
}
