if ! brew list | grep postgresql@11 > /dev/null
then
    echo "› brew install postgresql@11"
    brew install postgresql@11
    brew link postgresql@11
fi

brew services start postgresql@11
