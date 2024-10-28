# Remove the unsupported URL outputs
# This will avoid errors if `url` is unavailable.
output "go_api_service_id" {
  value = railway_service.go_api.id
}

output "nest_api_service_id" {
  value = railway_service.nest_api.id
}

# For the database service
# output "postgres_service_id" {
#   value = railway_service.postgresql_db.id
# }
