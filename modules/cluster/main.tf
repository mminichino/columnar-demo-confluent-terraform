#
terraform {
 required_providers {
   confluent = {
     source  = "confluentinc/confluent"
     version = "2.0.0"
   }
 }
}

resource "confluent_environment" "environment" {
  display_name = var.environment
}

resource "confluent_kafka_cluster" "basic" {
  display_name = "${var.environment}_cluster0"
  availability = var.availability
  cloud        = var.cloud
  region       = var.region
  basic {}

  environment {
    id = confluent_environment.environment.id
  }
}

resource "confluent_api_key" "cluster_key" {
  display_name = "${var.environment}_api_key0"
  owner {
    api_version = "iam/v2"
    id          = var.confluent_cloud_owner_id
    kind        = "User"
  }
  managed_resource {
    api_version = "cmk/v2"
    id          = confluent_kafka_cluster.basic.id
    kind        = "Cluster"
    environment {
      id = confluent_environment.environment.id
    }
  }
}
