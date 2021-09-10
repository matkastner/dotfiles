if ! brew list | grep crab > /dev/null
then
    echo "brew install dabapps/tap/crab"
    brew install dabapps/tap/crab
fi
