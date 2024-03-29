module "vault_cluster" {
  source                         = "git::https://github.com/bitrockteam/caravan-vault//modules/cluster-raft?ref=refs/tags/v0.3.26"
  control_plane_nodes_ids        = var.control_plane_nodes_ids
  control_plane_nodes            = var.control_plane_nodes
  control_plane_nodes_public_ips = var.control_plane_nodes_public_ips
  ssh_private_key                = var.ssh_private_key
  ssh_bastion_host               = var.ssh_bastion_host
  ssh_bastion_port               = var.ssh_bastion_port
  ssh_bastion_private_key        = var.ssh_bastion_private_key
  ssh_bastion_user               = var.ssh_bastion_user
  ssh_user                       = var.ssh_user
  ssh_timeout                    = var.ssh_timeout
  prefix                         = var.prefix

  unseal_type = var.unseal_type

  license = var.vault_license

  // TRANSIT
  transit_vault_address = var.transit_vault_address
  transit_mount_path    = var.transit_mount_path
  transit_vault_token   = var.transit_vault_token
  transit_key           = var.transit_key

  // OCI
  oci_key                 = var.oci_key
  oci_crypto_endpoint     = var.oci_crypto_endpoint
  oci_management_endpoint = var.oci_management_endpoint

  // GCP
  gcp_region     = var.gcp_region
  gcp_keyring    = var.gcp_keyring
  gcp_key        = var.gcp_key
  gcp_project_id = var.gcp_project_id

  // AWS
  aws_kms_region = var.aws_region
  aws_kms_key_id = var.aws_kms_key_id
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  aws_endpoint   = var.aws_endpoint

  // AZURE
  azure_tenant_id  = var.azure_tenant_id
  azure_vault_name = var.azure_vault_name
  azure_key_name   = var.azure_key_name
}

module "vault_cluster_agents" {
  source                  = "git::https://github.com/bitrockteam/caravan-vault//modules/agent?ref=refs/tags/v0.3.26"
  vault_endpoint          = var.vault_endpoint
  enable_nomad            = var.enable_nomad
  tcp_listener_tls        = var.tcp_listener_tls
  gcp_project_id          = var.gcp_project_id
  gcp_auto_auth           = var.agent_auto_auth_type == "gcp" ? true : false
  gcp_node_role           = var.gcp_node_role
  gcp_service_account     = var.gcp_service_account
  nodes_ids               = var.control_plane_nodes_ids
  nodes                   = var.control_plane_nodes
  nodes_public_ips        = var.control_plane_nodes_public_ips
  ssh_private_key         = var.ssh_private_key
  ssh_bastion_host        = var.ssh_bastion_host
  ssh_bastion_port        = var.ssh_bastion_port
  ssh_bastion_private_key = var.ssh_bastion_private_key
  ssh_bastion_user        = var.ssh_bastion_user
  ssh_user                = var.ssh_user
  ssh_timeout             = var.ssh_timeout
  aws_auto_auth           = var.agent_auto_auth_type == "aws" ? true : false
  aws_node_role           = var.aws_node_role
  azure_auto_auth         = var.agent_auto_auth_type == "azure" ? true : false
  azure_node_role         = var.azure_node_role
  azure_resource          = var.azure_resource
}

module "consul-cluster" {
  source                         = "git::https://github.com/bitrockteam/caravan-consul//modules/consul-cluster?ref=refs/tags/v0.1.14"
  ssh_user                       = var.ssh_user
  ssh_private_key                = var.ssh_private_key
  ssh_bastion_host               = var.ssh_bastion_host
  ssh_bastion_port               = var.ssh_bastion_port
  ssh_bastion_private_key        = var.ssh_bastion_private_key
  ssh_bastion_user               = var.ssh_bastion_user
  cluster_nodes_ids              = var.control_plane_nodes_ids
  cluster_nodes                  = var.control_plane_nodes
  cluster_nodes_public_ips       = var.control_plane_nodes_public_ips
  vault_address                  = module.vault_cluster.vault_address
  dc_name                        = var.dc_name
  service_dashboard_url_template = "https://grafana.${var.prefix}.${var.external_domain}/d/kDRlnfcGk/consul-connect-services?orgId=1&var-service={{Service.Name}}&var-namespace={{Service.Namespace}}&var-dc={{Datacenter}}"
  license                        = var.consul_license
  encryption_key                 = module.vault_cluster.consul_enc_key
}

module "nomad-cluster" {
  count = var.enable_nomad ? 1 : 0
  depends_on = [
    module.vault_cluster,
    module.consul-cluster
  ]
  source                   = "git::https://github.com/bitrockteam/caravan-nomad//modules/nomad-cluster?ref=refs/tags/v0.1.18"
  ssh_user                 = var.ssh_user
  ssh_private_key          = var.ssh_private_key
  ssh_bastion_host         = var.ssh_bastion_host
  ssh_bastion_port         = var.ssh_bastion_port
  ssh_bastion_private_key  = var.ssh_bastion_private_key
  ssh_bastion_user         = var.ssh_bastion_user
  cluster_nodes_ids        = var.control_plane_nodes_ids
  cluster_nodes            = var.control_plane_nodes
  cluster_nodes_public_ips = var.control_plane_nodes_public_ips
  dc_name                  = var.dc_name
  control_plane_vault_role = var.control_plane_role_name

  license = var.nomad_license
}
