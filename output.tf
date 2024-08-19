output "api_key" {
  value = module.cluster.cluster_api_key
}

output "api_secret" {
  sensitive = true
  value = module.cluster.cluster_api_secret
}

output "bootstrap" {
  value = module.cluster.bootstrap_servers
}
