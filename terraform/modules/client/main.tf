terraform {
   required_providers {
      docker = {
         source = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "client" {
   name = "prf-devops-quiz-client"

   build {
      context = "${path.cwd}/../client"
   }
}

resource "docker_container" "client" {
   name = "prf-devops-quiz-client"
   image = docker_image.client.name

   ports {
      internal = var.port
      external = var.port
   }

   networks_advanced {
      name = var.network_name
   }
}
