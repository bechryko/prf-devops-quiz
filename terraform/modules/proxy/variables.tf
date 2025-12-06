variable "depends_on_server" {
   type = any
}

variable "depends_on_client" {
   type = any
}

variable "port" {
   type = number
   default = 80
}

variable "network_name" {
   type = string
}
