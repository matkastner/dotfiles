function pyenv_install {
  export CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"

  pyenv install

  if [ ! $? -eq 0 ]
  then
    echo
    echo
    echo "Installing python failed, trying x86_64 instead..."
    echo
    arch -x86_64 pyenv install
  fi

  if [ ! $? -eq 0 ]
  then
    echo
    echo
    echo "Installing python failed, trying with patch instead..."
    echo
    pyenv install --patch < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)
  fi

  if [ ! $? -eq 0 ]
  then
    echo
    echo
    echo "Installing python failed, trying with patch and x86_64 instead..."
    echo
    arch -x86_64 pyenv install --patch < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)
  fi

  if [ ! $? -eq 0 ]
  then
    echo
    echo
    echo "Unable to install a working version of Python!"
    echo
  fi
}

function set_python_version {
  [ -s ".python-version" ] && { python --version || pyenv_install; }
}
