terraform {
   required_providers {
      docker = {
         source = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "proxy" {
   name = "nginx:stable-alpine"
}

resource "docker_container" "proxy" {
   name = "prf-devops-quiz-proxy"
   image = docker_image.proxy.name

   depends_on = [
      var.depends_on_server,
      var.depends_on_client
   ]

   volumes {
      host_path = "${path.cwd}/../nginx.conf"
      container_path = "/etc/nginx/nginx.conf"
   }

   ports {
      internal = var.port
      external = var.port
   }

   networks_advanced {
      name = var.network_name
   }
}
