# Gitlab Administration

## Backup

### Secrets

1. Find the object name for the rails secrets
```shell
kubectl -n gitlab get secrets | grep rails-secret
```

2. Save a copy of the rails secrets

```shell
kubectl -n gitlab get secrets <rails-secret-name> -o jsonpath="{.data['secrets\.yml']}" | base64 --decode > gitlab-secrets.yaml
```

### GitLab installation

Create the backup

1. Ensure the toolbox pod is running, by executing the following command shell

```shell
kubectl -n gitlab get pods -lrelease=gitlab,app=toolbox
```
2. Run the backup utility

```shell
kubectl -n gitlab exec <Toolbox pod name> -it -- backup-utility --skip db
```

3. Visit the gitlab-backups bucket in the object storage service and ensure a tarball has been added. It will be named in <backup_ID>_gitlab_backup.tar format. Read what the backup ID is about.

4. This tarball is required for restoration.

## Restore

TODO

