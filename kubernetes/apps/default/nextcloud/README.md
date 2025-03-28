# Nextcloud

## Initial installation

```shell
flux build kustomization nextcloud-redis --dry-run --path ./redis --kustomization-file=./ks.yaml | k apply -f -
flux build kustomization nextcloud --dry-run --path ./app --kustomization-file=./ks.yaml | k apply -f -
```

## OpenID

### Authentik

https://docs.goauthentik.io/integrations/services/nextcloud/#nextcloud

### Nextcloud
Add application "OpenID Connect user backend"

|Name|Value                                                                                 |
|-----|--------------------------------------------------------------------------------------|
|Identifier| Authentik                                                                            |
|Client ID| zauMj...                                                                             |
|Client Secret| {secret}                                                                             |
|Discovery endpoint| {auth-hostname}/application/o/nextcloud/.wellknown/openid-configutation   |
|Scope| email profile                                                                        |
|Use unique user id| unchecked                                                                            |
|Use provider identifier as prefix for ids| unchecked                                                                            |
|Use group provisioning| checked                                                                              |
|Check Bearer token on API and WebDav requests| unchecked                                                                            |
|Send ID token hint on logout| checked                                                                              |


## Post installation

Add these lines to config/config.php:

```shell
'allow_local_remote_servers' => true,
'default_phone_region' => 'NL',
```

## Clean installation with existing data

Delete/move the following directories before installation (in /var/www/html/data);
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

All data:
```shell
su -s /bin/sh -c  "./occ files:scan -v --all" www-data
```
Specific path:
```shell
su -s /bin/sh -c  "./occ files:scan -v --path={userid}/files/Some/Path" www-data
```

```shell
su -s /bin/sh -c  "./occ files:cleanup" www-data
```

## DB Conversie

To PostgreSQL

```shell
su www-data -s /bin/sh -c "./occ db:convert-type --all-apps pgsql nextcloud nextcloud-primary.nextcloud.svc nextcloud"
```
