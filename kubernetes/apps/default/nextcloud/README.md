# Nextcloud

## Initial installation

```shell
flux build kustomization nextcloud-redis --dry-run --path ./redis --kustomization-file=./ks.yaml | k apply -f -
flux build kustomization nextcloud --dry-run --path ./app --kustomization-file=./ks.yaml | k apply -f -
```

## OpenID

### Authentik

https://github.com/goauthentik/authentik/blob/main/website/integrations/services/nextcloud/index.md#openid-connect-auth

### Nextcloud
Add application "OpenID Connect user backend"

![Screenshot from 2023-12-29 16-20-08.png](..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2FPictures%2FScreenshots%2FScreenshot%20from%202023-12-29%2016-20-08.png)

## Post installation

Add these lines to config/config.php:

```shell
'allow_local_remote_servers' => true,
'default_phone_region' => 'NL',
```

## Clean installation with existing data

Delete/move the following directories before installation;
- admin
- appdata_oc*
- files_external
- .htaccess

## Conversions after upgrading

```shell
su -s /bin/sh -c  "./occ maintenance:mode --on" www-data
su -s /bin/sh -c  "./occ upgrade" www-data
su -s /bin/sh -c  "./occ db:add-missing-indices" www-data
su -s /bin/sh -c  "./occ db:add-missing-primary-keys" www-data
su -s /bin/sh -c  "./occ db:add-missing-columns" www-data
su -s /bin/sh -c  "./occ db:convert-filecache-bigint" www-data
su -s /bin/sh -c  "./occ maintenance:mode --off" www-data
```

## DB Maintenance

```shell
su -s /bin/sh -c  "./occ files:scan -v --all" www-data
su -s /bin/sh -c  "./occ files:scan -v --path={userid}/files/Some/Path" www-data
su -s /bin/sh -c  "./occ files:cleanup" www-data
```

## DB Conversie

To PostgreSQL

```shell
su www-data -s /bin/sh -c "./occ db:convert-type --all-apps pgsql nextcloud nextcloud-primary.nextcloud.svc nextcloud"
```
