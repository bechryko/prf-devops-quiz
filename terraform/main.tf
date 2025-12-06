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
}

module "server" {
   source = "./modules/server"
}

module "client" {
   source = "./modules/client"
}
