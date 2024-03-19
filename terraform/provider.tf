terraform {
  required_providers {
    paperspace = {
      source = "Paperspace/paperspace"
      version = "0.4.5"
    }
  }
}

provider "paperspace" {
  region = "East Coast (NY2)"
  api_key = var.api_key
}
variable "api_key" {}
