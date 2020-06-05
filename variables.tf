variable "subscription_id" { 
  description = "Subscription ID Details"
}

variable "client_id" {
  description = "The Client ID Details"
}

variable "client_secret" {
  description = "The Client Secret Details - This is being supplied in the GitHub Secrets"
}

variable "tenant_id" {
  description = "The Tenant ID Details"
}

variable "prefix" {
  description = "The prefix used for all resources in this example"
  default = "GHA-TF"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default = "eastus2"
}
