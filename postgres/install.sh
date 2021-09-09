if ! brew list | grep postgresql@11 > /dev/null
then
    echo "› installing postgresql@11"
    brew install postgresql@11
fi

brew link postgresql@11
brew services start postgresql@11
