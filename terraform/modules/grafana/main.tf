terraform {
   required_providers {
      docker = {
         source  = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

resource "docker_image" "grafana" {
   name = "grafana/grafana:latest"
}

resource "docker_container" "grafana" {
   name = "prf-devops-quiz-grafana"
   image = docker_image.grafana.image_id

   ports {
      internal = var.port
      external = var.port
   }

   env = [
      "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}",
      "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource"
   ]

   volumes {
      host_path = "/workspace/grafana/provisioning"
      container_path = "/etc/grafana/provisioning"
   }

   networks_advanced {
      name = var.network_name
   }
}
