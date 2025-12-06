terraform {
   required_providers {
      docker = {
         source = "kreuzwerker/docker"
         version = "3.6.2"
      }
   }
}

provider "docker" {}

module "mongo" {
   source = "./modules/mongo"
   network_name = docker_network.prf-devops-quiz_network.name
}

module "server" {
   source = "./modules/server"
   network_name = docker_network.prf-devops-quiz_network.name
}

module "client" {
   source = "./modules/client"
   network_name = docker_network.prf-devops-quiz_network.name
}

module "proxy" {
   source = "./modules/proxy"
   network_name = docker_network.prf-devops-quiz_network.name
   depends_on_server = module.server
   depends_on_client = module.client
}

resource "docker_network" "prf-devops-quiz_network" {
   name = "prf-devops-quiz_network"
}
