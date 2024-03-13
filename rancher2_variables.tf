variable "rancher2_api_url" {
  description = "provides rancher2 API endpoint URI"
  default = ""
}
variable "rancher2_access_key" {
  description = "provide rancher access key"
  default = ""
}

variable "rancher2_secret_key" {
  description = "provide rancher secret key"
  default = ""  
}

variable "rancher2_insecure" {
  # default = true
  type = bool
  description = "whether the rancher endpoint has secure SSL cert or not, true = not secure"
}

variable "rancher-kubernetes-version" {
  description = "provides the rancher kubernetes version"
  # default = "v1.27.10+rke2r1"
}

variable "cluster_name" {
  description = "Name for the cluster"
  default = ""
}

variable "charts_values_file" {
  default = ""
}
variable "upgrade_strategy_file" {
  default = ""
}

variable "machine_global_config_file" {
  default = ""
}

variable "additional_manifest_file" {
  default = ""
}
variable "registries_file" {
  default = ""
}

variable "enable_network_policy" {
  type = bool
  # default = false
}

variable "insecure_node_command" {
  default = ""
}

# variable "role" {
#   default = ""
# }

# variable "target_ip" {
#   default = ""
# }

variable "kubernetes_server_ips" {
  description = "List of Kubernetes server ip's"
  type    = set(string)
  # default = ["10.10.3.10", "10.10.3.11", "10.10.3.12"]
}

# variable "tls_ips" {
#   default = ""
# }

variable "rke_config" {
  default = ""
}