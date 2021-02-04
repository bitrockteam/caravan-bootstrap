// Common
variable "control_plane_nodes" {
  type = map(any)
}
variable "control_plane_nodes_ids" {
  type = list(string)
}
variable "control_plane_nodes_public_ips" {
  type = map(any)
}
variable "ssh_private_key" {
  type = string
}
variable "ssh_user" {
  type = string
}
variable "ssh_timeout" {
  type = string
}
variable "prefix" {
  type = string
}
variable "vault_endpoint" {
  type = string
}
variable "control_plane_role_name" {
  type = string
}
variable "tcp_listener_tls" {
  type    = bool
  default = false
}
variable "dc_name" {
  type = string
}
variable "unseal_type" {
  type    = string
  default = null
}
variable "agent_auto_auth_type" {
  type    = string
  default = null
}

// Transit
variable "transit_vault_address" {
  default = null
}
variable "transit_mount_path" {
  type    = string
  default = null
}
variable "transit_vault_token" {
  type    = string
  default = null
}
variable "transit_key" {
  type    = string
  default = null
}

// OCI
variable "oci_key" {
  type    = string
  default = null
}
variable "oci_crypto_endpoint" {
  type    = string
  default = null
}
variable "oci_management_endpoint" {
  type    = string
  default = null
}

// GCP
variable "gcp_region" {
  type    = string
  default = null
}
variable "gcp_keyring" {
  type    = string
  default = null
}
variable "gcp_key" {
  type    = string
  default = null
}
variable "gcp_project_id" {
  type    = string
  default = null
}
variable "gcp_node_role" {
  type    = string
  default = null
}
variable "gcp_service_account" {
  type    = string
  default = null
}

// AWS
variable "aws_region" {
  type    = string
  default = null
}
variable "aws_kms_key_id" {
  type    = string
  default = null
}
variable "aws_node_role" {
  type    = string
  default = null
}
variable "aws_access_key" {
  type    = string
  default = null
}
variable "aws_secret_key" {
  type    = string
  default = null
}
variable "aws_endpoint" {
  type    = string
  default = null
}
variable "azure_tenant_id" {
  type        = string
  default     = null
  description = "(optional) The tenant id for the Azure Active Directory organization."
}
variable "azure_environment" {
  type        = string
  default     = "AZUREPUBLICCLOUD"
  description = "(optional) The Azure Cloud environment API endpoints to use."
}
variable "azure_vault_name" {
  type        = string
  default     = null
  description = "(optional) The Key Vault vault to use the encryption keys for encryption and decryption."
}
variable "azure_key_name" {
  type        = string
  default     = null
  description = "(optional) The Key Vault key to use for encryption and decryption."
}
variable "azure_node_role" {
  type        = string
  default     = null
  description = "(optional) Configured Azure role of the node"
}
variable "azure_resource" {
  type        = string
  default     = "https://management.azure.com/"
  description = "(optional) A configured Azure AD application which is used as the resource for generating MSI access tokens"
}