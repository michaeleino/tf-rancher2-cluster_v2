
output "cluster_registration_token" {
  value = rancher2_cluster_v2.k8s-cluster.cluster_registration_token
  sensitive = true
}