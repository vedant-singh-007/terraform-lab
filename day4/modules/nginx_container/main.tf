resource "null_resource" "container" {

  triggers = {
    name  = var.container_name
    port  = var.container_port
    image = var.image_name
  }

  provisioner "local-exec" {
    command = "docker run -d -p ${self.triggers.port}:80 --name ${self.triggers.name} ${self.triggers.image}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "docker rm -f ${self.triggers.name} || true"
  }

}
