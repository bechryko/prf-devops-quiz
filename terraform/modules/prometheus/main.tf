terraform {
   required_providers {
      docker = {
         source  = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "prometheus" {
   name = "prf-devops-quiz-prometheus"

   build {
      context = path.module
      dockerfile = "Dockerfile-Prometheus"
   }
}

resource "docker_container" "prometheus" {
   name  = "prf-devops-quiz-prometheus"
   image = docker_image.prometheus.image_id

   ports {
      internal = var.port
      external = var.port
   }

   networks_advanced {
      name = var.network_name
   }
}
