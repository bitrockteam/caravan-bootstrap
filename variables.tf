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
variable "gcp_auto_auth" {
  type    = bool
  default = false
}
variable "unseal_project_id" {
  type    = string
  default = null
}
variable "unseal_keyring" {
  type    = string
  default = null
}
variable "unseal_key" {
  type    = string
  default = null
}
variable "cluster_nodes_ids" {
  type = list(string)
}
variable "cluster_nodes" {
  type = map(any)
}
variable "cluster_nodes_public_ips" {
  type    = map(any)
  default = null
}
variable "nodes" {
  type = map(any)
}
variable "nodes_ids" {
  type = list(string)
}
variable "nodes_public_ips" {
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
variable "vault_endpoint" {
  type = string
}
variable "tcp_listener_tls" {
  type    = bool
  default = false
}
variable "dc_name" {
  type = string
}