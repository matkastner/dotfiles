if ! brew list | grep python > /dev/null
then
    echo "› installing python"
    brew install python
fi

if ! brew list | grep pyenv > /dev/null
then
    echo "› installing pyenv"
    brew install pyenv
fi
