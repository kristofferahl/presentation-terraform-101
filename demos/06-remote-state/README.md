# Remote state

- Backends
  - AWS S3
  - Consul
  - ...

## TODO

1. Run terraform init
1. Run ls -lah
1. Run terraform apply
1. Run ls -lah again to show state files on disk
1. Uncomment the remote state block
1. Run terraform init (create the missing s3 bucket if it does not exist and run init again)
1. Accept "copy state"
1. Remove local state files and run init again
1. Run terraform destroy to remove the created resources
