terraform {
   required_providers {
      docker = {
         source = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "server" {
   name = "prf-devops-quiz-server"

   build {
      context = "${path.cwd}/../server"
   }
}

resource "docker_container" "server" {
   name = "prf-devops-quiz-server"
   image = docker_image.server.name

   env = [
      "MONGO_URL=mongodb://prf-devops-quiz-mongo:27017"
   ]

   ports {
      internal = var.port
      external = var.port
   }

   networks_advanced {
      name = var.network_name
   }
}
