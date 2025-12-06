terraform {
   required_providers {
      docker = {
         source = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "mongo" {
   name = "prf-devops-quiz-mongo"

   build {
      context = "${path.cwd}/.."
      dockerfile = "Dockerfile-MongoDB"
   }
}

resource "docker_container" "mongo" {
   name  = "prf-devops-quiz-mongo"
   image = docker_image.mongo.name

   ports {
      internal = var.port
      external = var.port
   }
}
