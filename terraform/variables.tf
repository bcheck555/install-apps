## Rancher
variable "RANCHER_URL" { }
variable "RANCHER_ACCESS_KEY" { }
variable "RANCHER_SECRET_KEY" { }
variable "RANCHER_CLOUD_CREDENTIAL" { }
variable "RANCHER_CNI" { }

## Cluster Config
variable "CLUSTER_NAME" { }
variable "CLUSTER_NAMESPACE" { }
variable "K8S_VERSION" { }
variable "CLUSTER_ROLE" { }
variable "KUBECONFIG" { }

## Harvester
variable "HARVESTER_CLUSTER_ID" { }
variable "HARVESTER_NAMESPACE" { }

## Logging and Monitoring
# ArgoCD
variable "ARGOCD_CHART" { }
# Monitoring chart
variable "MONITOR_CHART" { }
# Istio chart
variable "ISTIO_CHART" { }
# Longhorn chart
variable "LONGHORN_CHART" { }
# Cert-Manager chart
variable "CERT_MANAGER_CHART" { }
variable "CA_KEY" { default = "x" }
variable "CA_CRT" { default = "x" }
# Time to wait for Kubernetes to deploy before installing
variable "DELAYSEC" {
	default = 780
}
