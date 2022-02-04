## tfvars example

- tkcversion="v1.21.2+vmware.1-tkg.2"
- datacenter="/DC"
- datastore="/DC/datastore/vsanDatastore"
- workspace_network="/DC/network/vlan100"
- folder="/DC/vm"
- resource_pool="/DC/host/Cluster/Resources/tkgm"


## terraform apply

```
terraform plan -var='clustername=tkc-cl01' -var='endpoint=tenant.tmc.cloud.vmware.com' -var='token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

