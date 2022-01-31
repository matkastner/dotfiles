echo "› brew install openjdk adoptopenjdk/openjdk/adoptopenjdk11 adoptopenjdk/openjdk/adoptopenjdk8"
brew install openjdk adoptopenjdk/openjdk/adoptopenjdk11 adoptopenjdk/openjdk/adoptopenjdk8
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

if ! brew list | grep jenv > /dev/null
then
    echo "› brew install jenv"
    brew install jenv
fi

for jdk in /Library/Java/JavaVirtualMachines/*.jdk
do
    jenv add "$jdk/Contents/Home/"
done
