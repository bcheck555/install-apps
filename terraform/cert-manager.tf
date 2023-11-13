data "rancher2_project" "system" {
  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "System"
}

resource "rancher2_namespace" "cert-manager" {
  depends_on = [
    data.rancher2_project.system
  ]

  name = "cert-manager"
  project_id = data.rancher2_project.system.id
}

resource "rancher2_certificate" "certificate" {
  depends_on = [
    rancher2_namespace.cert-manager
  ]

  certs = base64encode(var.CA_CRT)
  key = base64encode(var.CA_KEY)
  name = "ca-key-pair"
  description = "cert-manager certificate"
  project_id = data.rancher2_project.system.id
  namespace_id = rancher2_namespace.cert-manager.id
}

resource "rancher2_catalog_v2" "jetstack" {
  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "jetstack"
  url = "https://charts.jetstack.io"
}

resource "rancher2_app_v2" "cert-manager" {
  depends_on = [
    rancher2_app_v2.rancher-monitoring,
    rancher2_catalog_v2.jetstack,
    rancher2_certificate.certificate
  ]

  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  name = "cert-manager"
  namespace = "cert-manager"
  repo_name = "jetstack"
  chart_name = "cert-manager"
  chart_version = var.CERT_MANAGER_CHART
  values = file("./cert-manager-values.yaml")
}

/*
resource "kubectl_manifest" "ca-issuer" {
  depends_on = [
    rancher2_app_v2.cert-manager
  ]

  yaml_body = <<-EOF
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: ca-issuer
      namespace: cert-manager
    spec:
      ca:
        secretName: ca-key-pair
    EOF
}
*/