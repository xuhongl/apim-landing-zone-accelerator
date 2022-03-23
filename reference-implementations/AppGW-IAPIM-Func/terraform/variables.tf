variable "workload_name" {
  type        = string
  description = "A short name for the workload being deployed"
  default     = "proy"
  validation {
    condition = (
      can(regex("^[a-zA-Z0-9]{3,8}$", var.workload_name))
    )
    error_message = "Please enter a valid value (alphanumberic no spaces less than 8 chars)."
  }
}

variable "deployment_environment" {
  type        = string
  description = "The environment for which the deployment is being executed"
  default     = "dev"

  validation {
    condition     = contains(["dev", "uat", "prod", "dr"], var.deployment_environment)
    error_message = "Valid values for var: deployment_environment are (dev, uat, prod, dr)."
  }
}

variable "location" {
  type        = string
  description = "The location in which the deployment is happening"
  default     = "East US"
  validation {
    condition = anytrue([
      var.location == "East US",
      var.location == "West US"
    ])
    error_message = "Please enter a valid Azure Region."
  }
}

variable "resource_suffix" {
  type        = string
  description = ""
  default     = "001"
}

variable "apim_name" {
  type        = string
  description = ""
  default     = "apim.contoso.com"
}

variable "app_gateway_fqdn" {
  type        = string
  description = ""
  default     = "api.contoso.com"
}

variable "certificate_path" {
  type        = string
  description = ""
  default     = "C:/Microsoft/Demo/sslcerts/rootcert.pfx"
}

variable "certificate_password" {
  type        = string
  description = ""
  default     = "password"
}

variable "certificate_secret_name" {
  type        = string
  description = ""
  default     = "root-ca"
}

# Backend resource variables 
variable "os_type" {
  type        = string
  description = "A string indicating the Operating System type for this function app"
  default     = "linux"
}

variable "cicd_agent_type" {
  type        = string
  description = "The CI/CD platform to be used, and for which an agent will be configured for the ASE deployment. Specify 'none' if no agent needed')"
  default     = "none"
}