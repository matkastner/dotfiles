if ! brew list | grep node > /dev/null
then
    echo "› brew install node"
    brew install node
    brew link node
fi

if ! brew list | grep nvm > /dev/null
then
    echo "› brew install nvm"
    brew install nvm
fi

mkdir -p ~/.nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

nvm install 'lts/*'
nvm alias default 'lts/*'
