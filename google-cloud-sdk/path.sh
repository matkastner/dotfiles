if [ -f '$(brew --prefix)/Caskroom/google-cloud-sdk/path.zsh.inc' ]
then
    source '$(brew --prefix)/Caskroom/google-cloud-sdk/path.zsh.inc'
fi

if [ -f '$(brew --prefix)/Caskroom/google-cloud-sdk/completion.zsh.inc' ]
then
    source '$(brew --prefix)/Caskroom/google-cloud-sdk/completion.zsh.inc'
fi
