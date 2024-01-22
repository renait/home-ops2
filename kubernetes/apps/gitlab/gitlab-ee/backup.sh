#!/bin/bash

POD_ID=$1
NAMESPACE=gitlab

# gitlab-ee-b556db4dc-vnnqv

mkdir -p backup && cd backup

# 1. Backup configuration
kubectl -n ${NAMESPACE} exec -i ${POD_ID} -- tar cvzf - /etc/gitlab > config.tgz
# 2. Backup database
kubectl -n ${NAMESPACE} exec -it ${POD_ID} -- gitlab-backup create
#kubectl -n ${NAMESPACE} exec -it ${POD_ID} -- gitlab-backup create SKIP=artifacts
#kubectl -n ${NAMESPACE} exec -it ${POD_ID} -- gitlab-backup create SKIP=artifacts,builds,lfs,registry
# Copy them to local directory
kubectl cp ${NAMESPACE}/${POD_ID}:/var/opt/gitlab/backups .
# 3. Backup packages
kubectl -n ${NAMESPACE} exec -i ${POD_ID} -- tar cvzf - /mnt/packages > packages.tgz

# list backups
kubectl -n ${NAMESPACE} exec -i ${POD_ID} -- ls -lth /var/opt/gitlab/backups

cd ..
