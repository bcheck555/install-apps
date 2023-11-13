### Rancher
RANCHER_URL = "https://rancher.packet.loss:4343"
RANCHER_CLOUD_CREDENTIAL = "harvester1"
RANCHER_CNI = "canal"

### Cluster Config
CLUSTER_NAME = "bc-test"
CLUSTER_NAMESPACE = "fleet-default"
K8S_VERSION = "v1.26.8+rke2r1"
CLUSTER_ROLE = "user"

### Harvester
HARVESTER_CLUSTER_ID = "c-m-pd27zf6h"
HARVESTER_NAMESPACE = "default"

### Logging and Monitoring
# ArgoCD chart
ARGOCD_CHART = "5.51.0"
# Cert-Manager chart
CERT_MANAGER_CHART = "v1.13.2"
# Istio chart
ISTIO_CHART = "102.3.1+up1.18.2"
# Longhorn chart
LONGHORN_CHART = "102.3.0+up1.5.1"
# Monitoring chart
MONITOR_CHART = "102.0.2+up40.1.2"

# Time to wait for Kubernetes to deploy before installing
DELAYSEC = 780
