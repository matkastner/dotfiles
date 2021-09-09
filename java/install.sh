if ! brew list | grep adoptopenjdk8 > /dev/null
then
    echo "› brew install adoptopenjdk/openjdk/adoptopenjdk8"
    brew install adoptopenjdk/openjdk/adoptopenjdk8
fi

if ! brew list | grep jenv > /dev/null
then
    echo "› brew install jenv"
    brew install jenv
fi

for jdk in /Library/Java/JavaVirtualMachines/*.jdk
do
    jenv add "$jdk/Contents/Home/"
done
