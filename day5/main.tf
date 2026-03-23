module "containers" {

  source = "./modules/nginx_container"

  for_each = {
    for c in var.container_config :
    c.name => c
  }

  container_name = each.value.name
  container_port = each.value.port
  image_name     = "nginx"

}


output "container_urls" {

  value = [
    for c in var.container_config :
    "http://localhost:${c.port}"
  ]

}
