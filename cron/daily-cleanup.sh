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
echo "Deleting old screenshots..."
find $HOME/Screenshot* -mtime +6 -type f -delete

# Clean desktop of files not modified in the last 24 hrs
# and put the in a folder named archive
# https://www.sitebase.be/automate-desktop-cleanup
ARCHIVE_DIR=~/Desktop/archive
DATE=$(date +"%Y%m%d")
EXPIRE=1449 # in minutes (1449 = 1 day)

cd ~/Desktop
FOLDER="$ARCHIVE_DIR/$DATE"
mkdir -p $FOLDER

find . -type f -mmin +$EXPIRE -maxdepth 1 -exec ls -u {} \; | while read line; do
  echo $line
  mv "$line" "$FOLDER"
done

echo "Archived all expired files"
