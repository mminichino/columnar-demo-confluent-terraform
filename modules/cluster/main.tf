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
