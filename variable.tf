# -----------------------------------------------------------------------------
# Baremetal Storage Variables
# -----------------------------------------------------------------------------
# Input variables used to configure the Airtel Cloud baremetal block storage
# volume.
# -----------------------------------------------------------------------------

variable "name" {
  description = "The name of the baremetal block storage volume. The name must be unique within the project."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The storage volume name must not be empty or contain only whitespace."
  }
}

variable "availability_zone" {
  description = "The availability zone where the baremetal block storage volume will be provisioned."
  type        = string

  validation {
    condition     = length(trimspace(var.availability_zone)) > 0
    error_message = "The availability zone must not be empty or contain only whitespace."
  }
}

variable "size" {
  description = "The size of the baremetal block storage volume in GB."
  type        = number

  validation {
    condition     = var.size > 0
    error_message = "The storage volume size must be greater than 0 GB."
  }
}

variable "description" {
  description = "An optional description for the baremetal block storage volume."
  type        = string
  default     = null
}