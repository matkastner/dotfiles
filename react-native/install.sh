if [[ -d /Applications/Xcode.app && $(xcode-select -p) != /Applications/Xcode.app ]]
then
    sudo xcode-select --switch /Applications/Xcode.app
fi

if ! brew list | grep watchman > /dev/null
then
    echo "› brew install watchman"
    brew install watchman
fi

if ! brew list | grep idb-companion > /dev/null
then
    echo "› brew install facebook/fb/idb-companion"
    brew install facebook/fb/idb-companion
fi

if ! brew list | grep flipper > /dev/null
then
    echo "› brew install flipper"
    brew install flipper
fi
