variable "react_app" {
  description = "Name of the static web app"
  type        = string
  default	  = "budget_tracker_app"
}

variable "resource_group_name" { 
  description = "The name of the resource group to create."
  default     = "my-project-rg1" # Default resource group name
}

variable "resource_group_location" {
  description = "Azure region for the static web app"
  type        = string
  default     = "eastus" # Default location
}

variable "branch" {
  description = "GitHub branch to deploy from"
  type        = string
  default     = "main" # Default location
}

variable "repository_url" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://github.com/asmitaakolte/Software-Developer-Project"
}

variable "app_location" {
  description = "Location of the app source code in the repository"
  type        = string
  default 	  = "./budget_tracker_app"
}

variable "output_location" {
  description = "Location of the app build output in the repository"
  type        = string
  default 	  = "build"
}
variable "environment" {
  type        = string
  description = "The environment tag for the resource group."
  default     = "Development"
}

variable "owner" {
  type        = string
  description = "The owner tag for the resource group."
  default     = "Asmita"
}
variable "aks"{
  type 		  = string
  description = "Name of AKS "
  default 	  = "aks-project"
}