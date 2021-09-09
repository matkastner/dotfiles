if ! brew list | grep python > /dev/null
then
    echo "› brew install python"
    brew install python
fi

if ! brew list | grep pyenv > /dev/null
then
    echo "› brew install pyenv"
    brew install pyenv
fi

if ! brew list | grep pyenv-virtualenv > /dev/null
then
    echo "› brew install pyenv-virtualenv"
    brew install pyenv-virtualenv
fi
