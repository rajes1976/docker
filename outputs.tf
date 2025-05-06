output "container_ids" {
  description = "IDs van de aangemaakte containers"
  value       = [for c in docker_container.nginx : c.id]
}

output "network_name" {
  description = "Naam van het Docker-netwerk"
  value       = docker_network.terra_net.name
}
