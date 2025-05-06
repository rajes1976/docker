# Terraform Docker Module

Deze module maakt een Docker-netwerk aan en NGINX-containers.

# Variabelen

- `network_name` – Naam van het Docker-netwerk
- `docker_image_name` – Docker-image (zoals nginx:latest)
- `containers` – Lijst van containers met naam, poort en omgeving

# Voorbeeldgebruik
Maak een test folder aan en gebruik dit als main.tf
terraform init
terraform apply

module "nginx_containers" {
  source             = "github.com/rajes1976/docker.git//?ref=master"
  network_name       = "terra_net_test"
  docker_image_name  = "nginx:1.27"
  containers = [
    { name = "app1", port = 8084, env = "prd" },
    { name = "app2", port = 8085, env = "prd" },
    { name = "app3", port = 8086, env = "acc" }
  ]
}
