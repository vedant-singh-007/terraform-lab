terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

resource "local_file" "file" {
  filename = var.filename
  content  = var.message
}

output "file_created" {
  value = local_file.file.filename
}
