variable "network_name" {
  description = "Name Docker-netwerk"
  type        = string
}

variable "docker_image_name" {
  description = "The name of the Docker image"
  type        = string
}

variable "containers" {
  description = "List of containers with name and port"
  type = list(object({
    name = string
    port = number
    env  = string
  }))

  validation {
    condition     = length(var.containers) >= 1
    error_message = "You must provide at least 1 container in the list."
  }

  validation {
    condition = alltrue([
      for container in var.containers : container.port >= 1024 && container.port <= 8089
    ])
    error_message = "All external ports must be between 1024 and 8089."
  }
}
