#!/bin/bash

PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

brew update
brew upgrade
brew cleanup -s
brew doctor
brew missing

apm upgrade -c false

# mas broke with macOS 10.13+
  # mas outdated 
  # mas upgrade

npm update -g
# echo “did you think to launch gem update “
# echo “and pip ? pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip install -U “

asdf update
asdf plugin-update --all

# delete screenshots older than a week
echo “Deleting old screenshots...“
find $HOME/Screenshot* -mtime +6 -type f -delete
