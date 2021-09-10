
sync_workspaces() {
    mkdir -p ~/Workspaces
    cd ~/.dotfiles
    git pull --ff-only

    cp ~/Workspaces/*.code-workspace ~/.dotfiles/github/workspaces
    cp ~/.dotfiles/github/workspaces/*.code-workspace ~/Workspaces

    git add github/workspaces/*.code-workspace
    git commit -m "Syncing workspaces"
    git push
    cd -
}

get_repos() {
    if ! gh auth status
    then
        gh auth login
    fi

    mkdir -p ~/Code/dabapps
    cd ~/Code/dabapps

    for repo in $(gh repo list dabapps --limit 5 --json name | jq -r '.[].name' | grep -i "${1}")
    do
        if [ -d ${repo} ]
        then
            echo "Skipping ${repo}..."
        else
            echo "Cloning ${repo}..."
            gh repo clone dabapps/${repo}
        fi
    done

    cd -

    sync_workspaces

    open ~/Workspaces/*${1}*.code-workspace
}
