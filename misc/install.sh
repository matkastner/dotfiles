if ! brew list | grep 1password > /dev/null
then
    echo "› brew install 1password"
    brew install 1password
fi

if ! brew list | grep visual-studio-code > /dev/null
then
    echo "› brew install visual-studio-code"
    brew install visual-studio-code
fi

if ! brew list | grep slack > /dev/null
then
    echo "› brew install slack"
    brew install slack
fi

if ! brew list | grep figma > /dev/null
then
    echo "› brew install figma"
    brew install figma
fi

if ! brew list | grep dropbox > /dev/null
then
    echo "› brew install dropbox"
    brew install dropbox
fi

if ! brew list | grep zoom > /dev/null
then
    echo "› brew install zoom"
    brew install zoom
fi

if ! brew list | grep brave-browser > /dev/null
then
    echo "› brew install brave-browser"
    brew install brave-browser
fi

if ! brew list | grep google-chrome > /dev/null
then
    echo "› brew install google-chrome"
    brew install google-chrome
fi

if ! brew list | grep firefox > /dev/null
then
    echo "› brew install firefox"
    brew install firefox
fi


if ! brew list | grep trello > /dev/null
then
    echo "› brew install trello"
    brew install trello
fi
