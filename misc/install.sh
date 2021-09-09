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
