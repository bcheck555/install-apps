/*
resource "rancher2_app_v2" "longhorn" {
  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "longhorn"
  namespace = "longhorn-system"
  repo_name = "rancher-charts"
  chart_name = "longhorn"
  chart_version = var.LONGHORN_CHART
  values = file("./longhorn-values.yaml")
}
*/

resource "rancher2_storage_class_v2" "longhorn-harvester" {
  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "longhorn-harvester"
  k8s_provisioner = "driver.harvesterhci.io"
  reclaim_policy = "Delete"
  parameters = {
    hostStorageClass: "harvester-longhorn"
  }
}