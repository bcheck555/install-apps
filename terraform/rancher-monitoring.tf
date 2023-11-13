resource "rancher2_app_v2" "rancher-monitoring" {
  depends_on = [
    rancher2_storage_class_v2.longhorn-harvester
  ]

  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "rancher-monitoring"
  namespace = "cattle-monitoring-system"
  repo_name = "rancher-charts"
  chart_name = "rancher-monitoring"
  chart_version = var.MONITOR_CHART
  #values = file("../values/rancher-monitoring.yaml")
}