terraform {
  required_providers {
    railway = {
      source  = "terraform-community-providers/railway"
      version = "0.4.4"
    }
  }
}


provider "railway" {
  token = var.railway_api_key
}

# Proyecto en Railway
resource "railway_project" "terraform_proyect" {
  name = "Terraform_proyect"
}

# Define the environment
resource "railway_environment" "staging" {
  name       = "staging"
  project_id = railway_project.terraform_proyect.id
}

# Define the Go API service and environment variables
resource "railway_service" "go_api" {
  name       = "go-api"
  project_id = railway_project.terraform_proyect.id
}

resource "railway_variable" "go_api_mailtrap_host" {
  name           = "MAILTRAP_HOST"
  value          = var.go_env_vars["MAILTRAP_HOST"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

resource "railway_variable" "go_api_mailtrap_port" {
  name           = "MAILTRAP_PORT"
  value          = var.go_env_vars["MAILTRAP_PORT"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

resource "railway_variable" "go_api_mailtrap_username" {
  name           = "MAILTRAP_USERNAME"
  value          = var.go_env_vars["MAILTRAP_USERNAME"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

resource "railway_variable" "go_api_mailtrap_password" {
  name           = "MAILTRAP_PASSWORD"
  value          = var.go_env_vars["MAILTRAP_PASSWORD"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

resource "railway_variable" "go_api_mailtrap_from" {
  name           = "MAILTRAP_FROM"
  value          = var.go_env_vars["MAILTRAP_FROM"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

resource "railway_variable" "go_api_jwt_secret" {
  name           = "JWT_SECRET"
  value          = var.go_env_vars["JWT_SECRET"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

resource "railway_variable" "go_api_connection_string" {
  name           = "CONNECTIONSTRING"
  value          = var.go_env_vars["CONNECTIONSTRING"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.go_api.id
}

# Define the Nest API service and its environment variables
resource "railway_service" "nest_api" {
  name       = "nest-api"
  project_id = railway_project.terraform_proyect.id
}

resource "railway_variable" "nest_api_firebase_project_id" {
  name           = "FIREBASE_PROJECT_ID"
  value          = var.nest_env_vars["FIREBASE_PROJECT_ID"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}

resource "railway_variable" "nest_api_firebase_private_key_id" {
  name           = "FIREBASE_PRIVATE_KEY_ID"
  value          = var.nest_env_vars["FIREBASE_PRIVATE_KEY_ID"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}

# resource "railway_variable" "nest_api_firebase_private_key" {
#   name           = "FIREBASE_PRIVATE_KEY"
#   value          = var.nest_env_vars["FIREBASE_PRIVATE_KEY"]
#   environment_id = railway_environment.staging.id
#   service_id     = railway_service.nest_api.id
# }

resource "railway_variable" "nest_api_firebase_client_email" {
  name           = "FIREBASE_CLIENT_EMAIL"
  value          = var.nest_env_vars["FIREBASE_CLIENT_EMAIL"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}

resource "railway_variable" "nest_api_firebase_client_id" {
  name           = "FIREBASE_CLIENT_ID"
  value          = var.nest_env_vars["FIREBASE_CLIENT_ID"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}

resource "railway_variable" "nest_api_firebase_client_x509_cert_url" {
  name           = "FIREBASE_CLIENT_X509_CERT_URL"
  value          = var.nest_env_vars["FIREBASE_CLIENT_X509_CERT_URL"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}

resource "railway_variable" "nest_api_back_end" {
  name           = "BACK_END"
  value          = var.nest_env_vars["BACK_END"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}

resource "railway_variable" "nest_api_api_key" {
  name           = "API_KEY"
  value          = var.nest_env_vars["API_KEY"]
  environment_id = railway_environment.staging.id
  service_id     = railway_service.nest_api.id
}




# Servicio de base de datos PostgreSQL
# resource "railway_service" "postgresql_db" {
#   name       = "postgresql-db"
#   project_id = railway_project.terraform_proyect.id
# }

# # Activador de despliegue para el servicio Nest.js
resource "railway_deployment_trigger" "nest_trigger" {
  repository     = "rpccode/car-nest-api"
  branch         = "master"
  check_suites   = true
  environment_id = railway_project.terraform_proyect.default_environment.id
  service_id     = railway_service.nest_api.id
}
resource "railway_deployment_trigger" "go_trigger" {
  repository     = "rpccode/car-go-api"
  branch         = "master"
  check_suites   = true
  environment_id = railway_project.terraform_proyect.default_environment.id
  service_id     = railway_service.nest_api.id
}

