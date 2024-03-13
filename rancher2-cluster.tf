
# Create a new rancher v2 RKE2 custom Cluster v2
resource "rancher2_cluster_v2" "k8s-cluster" {
  name = var.cluster_name
  # fleet_namespace = "fleet-ns"
  kubernetes_version = var.rancher-kubernetes-version
    # agent_env_vars - (Optional, list) Agent env vars is a list of additional environment variables to be appended to the cattle-cluster-agent and fleet-agent deployment, and the plan for the system upgrade controller to upgrade nodes.
    # cluster_agent_deployment_customization - (Optional, list) Cluster agent deployment customization specifies the additional tolerations, new affinity rules, and new resource requirements on the cattle-cluster-agent deployment. This argument is available in Rancher v2.7.5 and above.
    # fleet_agent_deployment_customization - (Optional, list) Fleet agent deployment customization specifies the additional tolerations, new affinity rules, and new resource requirements on the fleet-agent deployment. The argument is available in Rancher v2.7.5 and above.
    # rke_config - (Optional/computed, list, max length: 1) The RKE configuration for the cluster.
  
   rke_config {
    # templatefile(rke_config.tftpl, { tls_ips = var.tls_ips })
    # upgrade_strategy { ## to be written if needed
      
    # }
    additional_manifest = file(var.additional_manifest_file)
    chart_values = file(var.charts_values_file)
    machine_global_config = templatefile("${var.machine_global_config_file}", {tls_ips = var.kubernetes_server_ips} )
    registries {
      dynamic "configs" {
        for_each = var.registries_file.registry_config
        content {
        hostname = configs.value.hostname
        auth_config_secret_name = configs.value.auth_config_secret_name
        tls_secret_name = configs.value.tls_secret_name
        ca_bundle = configs.value.ca_bundle
        insecure = configs.value.insecure
        }
      }
      dynamic "mirrors" {
        for_each = var.registries_file.registry_mirror
        content {
          hostname = mirrors.value.hostname
          endpoints = mirrors.value.endpoints
          rewrites = tomap(mirrors.value.rewrites)
        }
      }
    }
  }  
    # local_auth_endpoint - (Optional, list, max length: 1) Local auth endpoint configures the Authorized Cluster Endpoint (ACE) which can be used to directly access the Kubernetes API server, without requiring communication through Rancher. For more information, please refer to Rancher Documentation.
    # cloud_credential_secret_name - (Optional, string) Cloud credential secret name is the secret to be used when a cloud credential secret name is not specified at the machine pool level.
    # default_pod_security_policy_template_name - (Optional, string) Default pod security policy template name specifies the default PSP for the cluster. For more information, please refer to Rancher Documentation.
    # default_pod_security_admission_configuration_template_name - (Optional, string) The name of the pre-defined pod security admission configuration template to be applied to the cluster. Rancher admins (or those with the right permissions) can create, manage, and edit those templates. For more information, please refer to Rancher Documentation. The argument is available in Rancher v2.7.2 and above.
    # default_cluster_role_for_project_members - (Optional, string) Default cluster role for project members.
  # default_cluster_role_for_project_members = "user"
    # enable_network_policy - (Optional, bool, default: false) Enable k8s network policy on the cluster.
  enable_network_policy = var.enable_network_policy
  # enable_network_policy = false
    # annotations - (Optional/computed, map) Annotations for the Cluster.
    # labels - (Optional/computed, map) Labels for the Cluster.
  

}
