#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [ -d /opt/homebrew/bin/ ]
  then
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  brew update
  brew upgrade
fi

exit 0
