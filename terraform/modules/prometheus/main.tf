terraform {
   required_providers {
      docker = {
         source  = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "prometheus" {
   name = "custom-prometheus:latest"

   build {
      context = path.module
      dockerfile = "Dockerfile-Prometheus"
   }
}

resource "docker_container" "prometheus" {
   name  = "prometheus"
   image = docker_image.prometheus.image_id

   ports {
      internal = var.port
      external = var.port
   }

   networks_advanced {
      name = var.network_name
   }
}
