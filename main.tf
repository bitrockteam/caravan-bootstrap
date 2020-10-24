module "vault_cluster" {
  source                   = "git::ssh://git@github.com/bitrockteam/hashicorp-vault-baseline//modules/cluster-raft?ref=master"
  unseal_project_id        = var.unseal_project_id
  unseal_keyring           = var.unseal_keyring
  unseal_key               = var.unseal_key
  cluster_nodes_ids        = var.cluster_nodes_ids
  cluster_nodes            = var.cluster_nodes
  cluster_nodes_public_ips = var.cluster_nodes_public_ips
  ssh_private_key          = var.ssh_private_key
  ssh_user                 = var.ssh_user
  ssh_timeout              = var.ssh_timeout
  gcp_project_id           = var.gcp_project_id
  gcp_node_role            = var.gcp_node_role
  gcp_service_account      = var.gcp_service_account
}

module "vault_cluster_agents" {
  source              = "git::ssh://git@github.com/bitrockteam/hashicorp-vault-baseline//modules/agent?ref=master"
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
  cluster_nodes_ids        = var.cluster_nodes_ids
  cluster_nodes            = var.cluster_nodes
  cluster_nodes_public_ips = var.cluster_nodes_public_ips
  vault_address            = module.vault_cluster.vault_address
  dc_name                  = var.dc_name
}

module "nomad-cluster" {
  source                   = "git::ssh://git@github.com/bitrockteam/hashicorp-nomad-baseline//modules/nomad-cluster?ref=master"
  ssh_private_key          = var.ssh_private_key
  cluster_nodes_ids        = var.cluster_nodes_ids
  cluster_nodes            = var.cluster_nodes
  cluster_nodes_public_ips = var.cluster_nodes_public_ips
  dc_name                  = var.dc_name
}
