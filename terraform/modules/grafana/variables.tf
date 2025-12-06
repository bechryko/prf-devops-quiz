variable "port" {
   type = number
   default = 3000
}

variable "network_name" {
   type = string
}

variable "prometheus_url" {
   type = string
}

variable "grafana_admin_password" {
   type = string
   default = "admin"
}
