# Caravan Bootstrap

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_consul-cluster"></a> [consul-cluster](#module\_consul-cluster) | git::https://github.com/bitrockteam/caravan-consul//modules/consul-cluster | feat/add_encryption |
| <a name="module_nomad-cluster"></a> [nomad-cluster](#module\_nomad-cluster) | git::https://github.com/bitrockteam/caravan-nomad//modules/nomad-cluster | refs/tags/v0.1.10 |
| <a name="module_vault_cluster"></a> [vault\_cluster](#module\_vault\_cluster) | git::https://github.com/bitrockteam/caravan-vault//modules/cluster-raft | feat/add_consul_encryption |
| <a name="module_vault_cluster_agents"></a> [vault\_cluster\_agents](#module\_vault\_cluster\_agents) | git::https://github.com/bitrockteam/caravan-vault//modules/agent | feat/add_consul_encryption |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_control_plane_nodes"></a> [control\_plane\_nodes](#input\_control\_plane\_nodes) | A map in form of 'node-name' => 'node's private IP' of the nodes to provision the cluster on | `map(any)` | n/a | yes |
| <a name="input_control_plane_nodes_ids"></a> [control\_plane\_nodes\_ids](#input\_control\_plane\_nodes\_ids) | list of strings which are IDs of the instance resources and are used to `trigger` the provisioning of `null` resources on instance recreation | `list(string)` | n/a | yes |
| <a name="input_control_plane_nodes_public_ips"></a> [control\_plane\_nodes\_public\_ips](#input\_control\_plane\_nodes\_public\_ips) | The public IPs of the node to SSH into them | `map(any)` | n/a | yes |
| <a name="input_control_plane_role_name"></a> [control\_plane\_role\_name](#input\_control\_plane\_role\_name) | n/a | `string` | n/a | yes |
| <a name="input_dc_name"></a> [dc\_name](#input\_dc\_name) | Name of the datacenter of the consul cluster | `string` | n/a | yes |
| <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain) | n/a | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | n/a | `string` | n/a | yes |
| <a name="input_ssh_timeout"></a> [ssh\_timeout](#input\_ssh\_timeout) | n/a | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | n/a | `string` | n/a | yes |
| <a name="input_vault_endpoint"></a> [vault\_endpoint](#input\_vault\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_agent_auto_auth_type"></a> [agent\_auto\_auth\_type](#input\_agent\_auto\_auth\_type) | n/a | `string` | `null` | no |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | n/a | `string` | `null` | no |
| <a name="input_aws_endpoint"></a> [aws\_endpoint](#input\_aws\_endpoint) | n/a | `string` | `null` | no |
| <a name="input_aws_kms_key_id"></a> [aws\_kms\_key\_id](#input\_aws\_kms\_key\_id) | n/a | `string` | `null` | no |
| <a name="input_aws_node_role"></a> [aws\_node\_role](#input\_aws\_node\_role) | n/a | `string` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS | `string` | `null` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `string` | `null` | no |
| <a name="input_azure_environment"></a> [azure\_environment](#input\_azure\_environment) | (optional) The Azure Cloud environment API endpoints to use. | `string` | `"AZUREPUBLICCLOUD"` | no |
| <a name="input_azure_key_name"></a> [azure\_key\_name](#input\_azure\_key\_name) | (optional) The Key Vault key to use for encryption and decryption. | `string` | `null` | no |
| <a name="input_azure_node_role"></a> [azure\_node\_role](#input\_azure\_node\_role) | (optional) Configured Azure role of the node | `string` | `null` | no |
| <a name="input_azure_resource"></a> [azure\_resource](#input\_azure\_resource) | (optional) A configured Azure AD application which is used as the resource for generating MSI access tokens | `string` | `"https://management.azure.com/"` | no |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | (optional) The tenant id for the Azure Active Directory organization. | `string` | `null` | no |
| <a name="input_azure_vault_name"></a> [azure\_vault\_name](#input\_azure\_vault\_name) | (optional) The Key Vault vault to use the encryption keys for encryption and decryption. | `string` | `null` | no |
| <a name="input_consul_license"></a> [consul\_license](#input\_consul\_license) | Consul Enterprise License | `string` | `""` | no |
| <a name="input_gcp_key"></a> [gcp\_key](#input\_gcp\_key) | n/a | `string` | `null` | no |
| <a name="input_gcp_keyring"></a> [gcp\_keyring](#input\_gcp\_keyring) | n/a | `string` | `null` | no |
| <a name="input_gcp_node_role"></a> [gcp\_node\_role](#input\_gcp\_node\_role) | n/a | `string` | `null` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | n/a | `string` | `null` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP | `string` | `null` | no |
| <a name="input_gcp_service_account"></a> [gcp\_service\_account](#input\_gcp\_service\_account) | n/a | `string` | `null` | no |
| <a name="input_nomad_license"></a> [nomad\_license](#input\_nomad\_license) | Nomad Enterprise License | `string` | `""` | no |
| <a name="input_oci_crypto_endpoint"></a> [oci\_crypto\_endpoint](#input\_oci\_crypto\_endpoint) | n/a | `string` | `null` | no |
| <a name="input_oci_key"></a> [oci\_key](#input\_oci\_key) | OCI | `string` | `null` | no |
| <a name="input_oci_management_endpoint"></a> [oci\_management\_endpoint](#input\_oci\_management\_endpoint) | n/a | `string` | `null` | no |
| <a name="input_tcp_listener_tls"></a> [tcp\_listener\_tls](#input\_tcp\_listener\_tls) | n/a | `bool` | `false` | no |
| <a name="input_transit_key"></a> [transit\_key](#input\_transit\_key) | n/a | `string` | `null` | no |
| <a name="input_transit_mount_path"></a> [transit\_mount\_path](#input\_transit\_mount\_path) | n/a | `string` | `null` | no |
| <a name="input_transit_vault_address"></a> [transit\_vault\_address](#input\_transit\_vault\_address) | Transit | `any` | `null` | no |
| <a name="input_transit_vault_token"></a> [transit\_vault\_token](#input\_transit\_vault\_token) | n/a | `string` | `null` | no |
| <a name="input_unseal_type"></a> [unseal\_type](#input\_unseal\_type) | n/a | `string` | `null` | no |
| <a name="input_vault_license"></a> [vault\_license](#input\_vault\_license) | Vault Enterprise License | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consul_address"></a> [consul\_address](#output\_consul\_address) | n/a |
| <a name="output_vault_address"></a> [vault\_address](#output\_vault\_address) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
