terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.23.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "terra_net" {
  name = var.network_name
}

resource "docker_image" "nginx" {
  name         = var.docker_image_name
  keep_locally = false
}

resource "docker_container" "nginx" {
  for_each = { for container in var.containers : container.name => container }

  name         = each.value.name
  image        = docker_image.nginx.image_id
  env          = ["env=${each.value.env}"]
  network_mode = "bridge"

  ports {
    internal = 80
    external = each.value.port
  }

  networks_advanced {
    name = docker_network.terra_net.name
  }
}
