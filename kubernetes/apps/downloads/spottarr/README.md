```shell
kubectl patch secret -n downloads spottarr-pguser-spottarr -p '{"stringData":{"password":"mypassword","verifier":""}}'
```
