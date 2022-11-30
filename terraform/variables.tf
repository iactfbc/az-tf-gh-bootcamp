variable "resource_groups" {
  type = map(object({
    location = string
  }))
}

variable "resource_groups2" {
  type = string
  description = "Secondary rg"
}
