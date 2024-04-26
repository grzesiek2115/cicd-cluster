provider minikube {
  kubernetes_version = "v1.28.3"
}

resource "minikube_cluster" "cluster" {
  cluster_name = "cicd"
  vm        = true
  nodes     = 3
  driver    = "docker"
#   cni       = "bridge"
  addons    = [
    "default-storageclass",
    "storage-provisioner"
  ]
}