if test ! $(which brew)
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -d ~/.dotfiles ];
then
    cd ~/.dotfiles
    git pull --ff-only
else
    git clone https://github.com/matkastner/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles
script/bootstrap
