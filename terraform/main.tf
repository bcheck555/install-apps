# Terraform resources 

# Rancher cloud credentials
data "rancher2_cloud_credential" "cloud_credential" {
  name = var.RANCHER_CLOUD_CREDENTIAL
}

data "rancher2_cluster_v2" "cluster" {
  name = var.CLUSTER_NAME
}
