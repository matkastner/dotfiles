if ! brew list | grep jq > /dev/null
then
    echo "brew install jq"
    brew install jq
fi

if ! brew list | grep gh > /dev/null
then
    echo "brew install gh"
    brew install gh
fi

if ! brew list | grep mysides > /dev/null
then
    echo "brew install mysides"
    brew install mysides
fi

mysides remove Workspaces

if [ -f "$HOME/Dropbox (Personal)/Workspaces.savedSearch" ]
then
    mysides add Workspaces "file://$HOME/Dropbox (Personal)/Workspaces.savedSearch"
fi
