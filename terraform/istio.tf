resource "rancher2_app_v2" "rancher-istio" {
  depends_on = [
    rancher2_app_v2.rancher-monitoring # Rancher-istio requires rancher-monitoring
  ]

  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "rancher-istio"
  namespace = "istio-system"
  repo_name = "rancher-charts"
  chart_name = "rancher-istio"
  chart_version = var.ISTIO_CHART
  #values = 
}