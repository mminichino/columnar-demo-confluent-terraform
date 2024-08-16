#
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "2.0.0"
    }
  }
}

provider "confluent" {
  alias            = "primary"
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}

module "cluster" {
  source = "./modules/cluster"
  providers = {
    confluent = confluent.primary
  }
  availability = var.availability
  cloud        = var.cloud
  environment  = var.environment
  region       = var.region
}


module "connector" {
  source = "./modules/connector"
  providers = {
    confluent = confluent.primary
  }
  api_key        = var.confluent_cloud_api_key
  api_secret     = var.confluent_cloud_api_secret
  cluster_id     = module.cluster.cluster_id
  environment    = var.environment
  environment_id = module.cluster.environment_id
  mongo_hostname = var.mongo_hostname
  mongo_password = var.mongo_password
  mongo_username = var.mongo_username
}
