#!/bin/bash

## IMPORTANT: Disable readiness and liveness probes before running restore!

# e.g. gitlab-ee-b556db4dc-vnnqv
POD_ID=$1
# e.g. 1611416895_2021_01_23_13.8.0-ee
BACKUP_ID=$2

mkdir -p backup && cd backup

# 1. copy the desired backup file into to the container
kubectl cp ${BACKUP_ID}_gitlab_backup.tar gitlab/${POD_ID}:/var/opt/gitlab/backups
kubectl -n gitlab exec ${POD_ID} -- chmod og-rwx /var/opt/gitlab/backups/${BACKUP_ID}_gitlab_backup.tar
kubectl -n gitlab exec ${POD_ID} -- chown git.git /var/opt/gitlab/backups/${BACKUP_ID}_gitlab_backup.tar

kubectl -n gitlab exec ${POD_ID} -- gitlab-ctl stop unicorn
kubectl -n gitlab exec ${POD_ID} -- gitlab-ctl stop puma
kubectl -n gitlab exec ${POD_ID} -- gitlab-ctl stop sidekiq

# 1. Restore configuration
zcat config.tgz | kubectl -n gitlab exec -i ${POD_ID} -- tar xf -
# 2. Restore database
kubectl -n gitlab exec -it ${POD_ID} -- gitlab-backup restore BACKUP=${BACKUP_ID}
# 3. Restore packages
zcat packages.tgz | kubectl -n gitlab exec -i ${POD_ID} -- tar xf -

cd ..