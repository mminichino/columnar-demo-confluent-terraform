variable "environment" {
  type        = string
}

variable "mongo_username" {
  description = "Mongo connect string"
  type        = string
}

variable "mongo_password" {
  description = "Mongo connect string"
  type        = string
}

variable "mongo_hostname" {
  description = "Mongo connect string"
  type        = string
}

variable "api_key" {
  description = "API Key"
  type        = string
}

variable "api_secret" {
  description = "API Secret"
  type        = string
}

variable "environment_id" {
  type        = string
}

variable "cluster_id" {
  type        = string
}
