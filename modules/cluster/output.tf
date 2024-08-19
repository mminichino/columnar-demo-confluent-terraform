output "environment_id" {
  value = confluent_environment.environment.id
}

output "cluster_id" {
  value = confluent_kafka_cluster.basic.id
}

output "cluster_api_key" {
  value = confluent_api_key.cluster_key.id
}

output "cluster_api_secret" {
  value = confluent_api_key.cluster_key.secret
}
