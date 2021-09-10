if ! brew list | grep google-cloud-sdk > /dev/null
then
    echo "brew install google-cloud-sdk"
    brew install google-cloud-sdk
fi
