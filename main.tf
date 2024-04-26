provider "kind" {}

resource "kind_cluster" "cicd" {
    name        = "cicd"
    node_image  = "kindest/node:v1.18.4"
    kind_config {
        kind        = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"

        node {
        role = "control-plane"

        kubeadm_config_patches = [
            "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
        ]
        extra_port_mappings {
            container_port = 80
            host_port      = 80
            listen_address  = "0.0.0.0"
        }
        extra_port_mappings {
            container_port = 443
            host_port      = 443
            listen_address  = "0.0.0.0"
        }
        }

        node {
        role = "worker"
        }

        node {
        role = "worker"
        }
    }
    }