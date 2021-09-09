if ! brew list | grep node@12 > /dev/null
then
    echo "› installing node@12"
    brew install node@12
    brew link node@12
fi

if ! brew list | grep nvm > /dev/null
then
    echo "› installing nvm"
    brew install nvm
fi

mkdir -p ~/.nvm
