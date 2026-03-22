terraform {
  required_version = ">= 1.0"
}

variable "container_name" {
  default = "tf-nginx"
}

variable "port" {
  default = 8080
}

resource "null_resource" "docker_container" {

  triggers = {
    name = var.container_name
    port = var.port
  }

  provisioner "local-exec" {
    command = "docker run -d -p ${var.port}:80 --name ${var.container_name} nginx"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "docker rm -f tf-nginx || true"
  }

}

output "container_name" {
  value = var.container_name
}

output "port" {
  value = var.port
}

