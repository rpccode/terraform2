# variables.tf
variable "railway_api_key" {
  description = "Railway API key for authentication"
  type        = string
  sensitive   = true
}

variable "go_env_vars" {
  description = "Environment variables for the Go API"
  type        = map(string)
}

variable "nest_env_vars" {
  description = "Environment variables for the NestJS API"
  type        = map(string)
}
