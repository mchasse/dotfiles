!# /bin/bash
# info from: https://andykdocs.de/development/Linux/2013-01-17+Rsync+over+SSH+with+Key+Authentication
# sh-keygen -t rsa -b 2048 -f backup-rsync-key
#
# Move the public(!) key to the remote server:
#
# scp backup-rsync-key.pub andy@example.net:/home/andy/
#
# Append the public key to the “authorized_keys” on your remote server:
#
# ssh -l andy example.net
# cat backup-rsync-key.pub >> .ssh/authorized_keys
#
# Test the connection:
#
# ssh -l andy -i ~/.ssh/backup-rsync-key example.net
#
# rsync --progress -avz -e "ssh -i /home/dev/.ssh/backup-rsync-key" /home/dev/git-master/ andy@example.net:/home/andy/git-master/
BACKUP_FOLDER=$HOME/Rsynced
COMPUTER_NAME=Laptop
REMOTE_LOCATION=person@server.com:/home/person/${ComputerName}Rsynced

rsync --exclude "data" --progress -avz -e "ssh -i ${HOME}/.ssh/backup-rsync-key" $BACKUP_FOLDER $REMOTE_LOCATION
