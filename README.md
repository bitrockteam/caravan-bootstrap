# Caravan Bootstrap

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| consul-cluster | git::ssh://git@github.com/bitrockteam/caravan-consul//modules/consul-cluster?ref=grafana-dashboard |  |
| nomad-cluster | git::ssh://git@github.com/bitrockteam/caravan-nomad//modules/nomad-cluster?ref=main |  |
| vault_cluster | git::ssh://git@github.com/bitrockteam/caravan-vault//modules/cluster-raft?ref=main |  |
| vault_cluster_agents | git::ssh://git@github.com/bitrockteam/caravan-vault//modules/agent?ref=main |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| control\_plane\_nodes | A map in form of 'node-name' => 'node's private IP' of the nodes to provision the cluster on | `map(any)` | n/a | yes |
| control\_plane\_nodes\_ids | list of strings which are IDs of the instance resources and are used to `trigger` the provisioning of `null` resources on instance recreation | `list(string)` | n/a | yes |
| control\_plane\_nodes\_public\_ips | The public IPs of the node to SSH into them | `map(any)` | n/a | yes |
| control\_plane\_role\_name | n/a | `string` | n/a | yes |
| dc\_name | Name of the datacenter of the consul cluster | `string` | n/a | yes |
| prefix | n/a | `string` | n/a | yes |
| ssh\_private\_key | n/a | `string` | n/a | yes |
| ssh\_timeout | n/a | `string` | n/a | yes |
| ssh\_user | n/a | `string` | n/a | yes |
| vault\_endpoint | n/a | `string` | n/a | yes |
| agent\_auto\_auth\_type | n/a | `string` | `null` | no |
| aws\_access\_key | n/a | `string` | `null` | no |
| aws\_endpoint | n/a | `string` | `null` | no |
| aws\_kms\_key\_id | n/a | `string` | `null` | no |
| aws\_node\_role | n/a | `string` | `null` | no |
| aws\_region | AWS | `string` | `null` | no |
| aws\_secret\_key | n/a | `string` | `null` | no |
| azure\_environment | (optional) The Azure Cloud environment API endpoints to use. | `string` | `"AZUREPUBLICCLOUD"` | no |
| azure\_key\_name | (optional) The Key Vault key to use for encryption and decryption. | `string` | `null` | no |
| azure\_node\_role | (optional) Configured Azure role of the node | `string` | `null` | no |
| azure\_resource | (optional) A configured Azure AD application which is used as the resource for generating MSI access tokens | `string` | `"https://management.azure.com/"` | no |
| azure\_tenant\_id | (optional) The tenant id for the Azure Active Directory organization. | `string` | `null` | no |
| azure\_vault\_name | (optional) The Key Vault vault to use the encryption keys for encryption and decryption. | `string` | `null` | no |
| consul\_license | Consul Enterprise License | `string` | `""` | no |
| gcp\_key | n/a | `string` | `null` | no |
| gcp\_keyring | n/a | `string` | `null` | no |
| gcp\_node\_role | n/a | `string` | `null` | no |
| gcp\_project\_id | n/a | `string` | `null` | no |
| gcp\_region | GCP | `string` | `null` | no |
| gcp\_service\_account | n/a | `string` | `null` | no |
| nomad\_license | Nomad Enterprise License | `string` | `""` | no |
| oci\_crypto\_endpoint | n/a | `string` | `null` | no |
| oci\_key | OCI | `string` | `null` | no |
| oci\_management\_endpoint | n/a | `string` | `null` | no |
| tcp\_listener\_tls | n/a | `bool` | `false` | no |
| transit\_key | n/a | `string` | `null` | no |
| transit\_mount\_path | n/a | `string` | `null` | no |
| transit\_vault\_address | Transit | `any` | `null` | no |
| transit\_vault\_token | n/a | `string` | `null` | no |
| unseal\_type | n/a | `string` | `null` | no |
| vault\_license | Vault Enterprise License | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| consul\_address | n/a |
| vault\_address | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
