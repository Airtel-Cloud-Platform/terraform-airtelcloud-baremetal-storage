# -----------------------------------------------------------------------------
# Baremetal Storage Outputs
# -----------------------------------------------------------------------------
# Outputs the identifiers and status information returned by the Airtel Cloud
# baremetal storage resource.
# -----------------------------------------------------------------------------

output "id" {
  description = "The unique identifier of the baremetal block storage volume."
  value       = airtelcloud_baremetal_storage.this.id
}

output "state" {
  description = "The current state of the baremetal block storage volume."
  value       = airtelcloud_baremetal_storage.this.state
}

output "failed_state_error" {
  description = "The error message associated with the volume when it enters a failed state."
  value       = airtelcloud_baremetal_storage.this.failed_state_error
}


output "uuid" {
  description = "The UUID assigned to the baremetal block storage volume."
  value       = airtelcloud_baremetal_storage.this.uuid
}

output "provider_volume_id" {
  description = "The provider-specific identifier of the underlying storage volume."
  value       = airtelcloud_baremetal_storage.this.provider_volume_id
}