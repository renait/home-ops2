# Spotweb

## Initial installation

1. Comment out the database settings (SPOTWEB_DB_*) in helmrelease.yaml
2. Comment out the "dataSource" section in postgresCluster.yaml
3. Commit changes and app will spin up
4. Retrieve the db host and password from secret spotweb-pguser-spotweb
5. Go to <host>/install.php and fill out the forms
6. Wait for the first backup to be done
7. Uncomment the stuff under 1 and 2
8. Commit and maken installation permanent.

## Delete installation

1. Comment out the Kustomization "spotweb" in downloads/kustomization.yaml
2. Retry installation, restore backup etc.
