function pyenv_install {
  CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" arch -x86_64 pyenv install --patch < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)
}

function set_python_version {
  [ -s ".python-version" ] && { python --version || pyenv_install; }
}
