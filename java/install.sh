if ! brew list | grep adoptopenjdk8 > /dev/null
then
    echo "› brew install adoptopenjdk/openjdk/adoptopenjdk8"
    brew install adoptopenjdk/openjdk/adoptopenjdk8
fi
