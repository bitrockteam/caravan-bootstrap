module "vault_cluster" {
  source                   = "git::ssh://git@github.com/bitrockteam/hashicorp-vault-baseline//modules/cluster-raft?ref=master"
  cluster_nodes_ids        = var.nodes_ids
  cluster_nodes            = var.nodes
  cluster_nodes_public_ips = var.nodes_public_ips
  ssh_private_key          = var.ssh_private_key
  ssh_user                 = var.ssh_user
  unseal_type              = var.unseal_type
  unseal_region            = var.unseal_region
  ssh_timeout              = var.ssh_timeout
  unseal_project_id        = var.unseal_project_id
  unseal_keyring           = var.unseal_keyring
  unseal_key               = var.unseal_key
  gcp_project_id           = var.gcp_project_id
  gcp_node_role            = var.gcp_node_role
  gcp_service_account      = var.gcp_service_account
  prefix                   = var.prefix
}

module "vault_cluster_agents" {
  source              = "git::ssh://git@github.com/bitrockteam/hashicorp-vault-baseline//modules/agent?ref=feature/refactoring"
  vault_endpoint      = var.vault_endpoint
  tcp_listener_tls    = var.tcp_listener_tls
  gcp_project_id      = var.gcp_project_id
  gcp_auto_auth       = var.gcp_auto_auth
  gcp_node_role       = var.gcp_node_role
  gcp_service_account = var.gcp_service_account
  nodes_ids           = var.nodes_ids
  nodes               = var.nodes
  nodes_public_ips    = var.nodes_public_ips
  ssh_private_key     = var.ssh_private_key
  ssh_user            = var.ssh_user
  ssh_timeout         = var.ssh_timeout
}

module "consul-cluster" {
  source                   = "git::ssh://git@github.com/bitrockteam/hashicorp-consul-baseline//modules/consul-cluster?ref=master"
  ssh_private_key          = var.ssh_private_key
  cluster_nodes_ids        = var.nodes_ids
  cluster_nodes            = var.nodes
  cluster_nodes_public_ips = var.nodes_public_ips
  vault_address            = module.vault_cluster.vault_address
  dc_name                  = var.dc_name
}

module "nomad-cluster" {
  depends_on = [
    module.vault_cluster,
    module.consul-cluster
  ]
  source                   = "git::ssh://git@github.com/bitrockteam/hashicorp-nomad-baseline//modules/nomad-cluster?ref=master"
  ssh_private_key          = var.ssh_private_key
  cluster_nodes_ids        = var.nodes_ids
  cluster_nodes            = var.nodes
  cluster_nodes_public_ips = var.nodes_public_ips
  dc_name                  = var.dc_name
  control_plane_vault_role = var.control_plane_role_name
}
