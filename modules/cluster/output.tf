output "environment_id" {
  value = confluent_environment.environment.id
}

output "cluster_id" {
  value = confluent_kafka_cluster.basic.id
}
