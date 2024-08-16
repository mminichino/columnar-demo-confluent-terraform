#
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "2.0.0"
    }
  }
}

data "confluent_environment" "environment" {
  id = var.environment_id
}

data "confluent_kafka_cluster" "basic" {
  id = var.cluster_id
  environment {
    id = var.environment_id
  }
}

resource "confluent_connector" "source" {
  environment {
    id = data.confluent_environment.environment.id
  }
  kafka_cluster {
    id = data.confluent_kafka_cluster.basic.id
  }

  config_sensitive = {
    "connection.password" = var.mongo_password
    "kafka.api.key"       = var.api_key
    "kafka.api.secret"    = var.api_secret
  }

  config_nonsensitive = {
    "batch.size"                                     = "0"
    "change.stream.full.document"                    = "default"
    "change.stream.full.document.before.change"      = "default"
    "connection.host"                                = var.mongo_hostname
    "connection.user"                                = var.mongo_username
    "connector.class"                                = "MongoDbAtlasSource"
    "heartbeat.interval.ms"                          = "0"
    "heartbeat.topic.name"                           = "__mongodb_heartbeats"
    "json.output.decimal.format"                     = "NUMERIC"
    "kafka.auth.mode"                                = "KAFKA_API_KEY"
    "linger.ms"                                      = "0"
    "mongo.errors.tolerance"                         = "NONE"
    "name"                                           = "${var.environment}_connector0"
    "output.data.format"                             = "JSON"
    "output.json.format"                             = "SimplifiedJson"
    "output.schema.infer.value"                      = "true"
    "pipeline"                                       = "[]"
    "poll.await.time.ms"                             = "5000"
    "poll.max.batch.size"                            = "100"
    "producer.batch.size"                            = "16384"
    "publish.full.document.only"                     = "true"
    "publish.full.document.only.tombstone.on.delete" = "true"
    "schema.context.name"                            = "default"
    "server.api.deprecation.errors"                  = "false"
    "server.api.strict"                              = "false"
    "startup.mode"                                   = "copy_existing"
    "tasks.max"                                      = "1"
    "topic.prefix"                                   = "mongo"
    "topic.separator"                                = "."
    "value.subject.name.strategy"                    = "TopicNameStrategy"
  }
}
