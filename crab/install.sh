if ! brew list | grep crab > /dev/null
then
    echo "› installing crab"
    brew install crab
fi
