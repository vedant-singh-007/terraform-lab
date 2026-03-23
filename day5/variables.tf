variable "container_config" {
  description = "List of containers"

  type = list(object({
    name = string
    port = number
  }))
}
