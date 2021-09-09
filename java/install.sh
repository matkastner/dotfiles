if ! brew list | grep adoptopenjdk/openjdk/adoptopenjdk8 > /dev/null
then
    echo "› installing adoptopenjdk/openjdk/adoptopenjdk8"
    brew install adoptopenjdk/openjdk/adoptopenjdk8
fi
