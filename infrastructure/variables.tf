# Credenciais OCI
variable "tenancy_ocid" {
  description = "OCID of the tenancy"
  type        = string
}

variable "user_ocid" {
  description = "OCID of the user"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint of the API key"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "sa-saopaulo-1"
}

variable "compartment_ocid" {
  description = "OCID of the compartment"
  type        = string
}

# Configurações do projeto
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "predictive-maintenance"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}