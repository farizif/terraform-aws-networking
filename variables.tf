variable "vpc_config" {
  description = "Configuring some core VPC settings including CIDR block and name."
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The vpc_cidr must contain a valid CIDR block"
  }
}

variable "subnet_config" {
  description = <<EOT
Accept a map of subnet configuration. Each subnet configuration must include:
cidr_block: The CIDR block of the subnet.
public: The subnet should be set either public or not (default value is private).
az: The AZ location that we want to put the subnet in.
  EOT
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
    az         = string
  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The cidr_block config option must contain a valid CIDR block"
  }

}