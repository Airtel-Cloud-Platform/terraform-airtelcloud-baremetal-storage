# -----------------------------------------------------------------------------
# Baremetal Storage
# -----------------------------------------------------------------------------
# Creates and manages a baremetal block storage volume in Airtel Cloud.
#
# The storage volume is provisioned in the specified availability zone with
# the requested capacity. The name, availability zone, and size are immutable
# and changes to these values will force the volume to be recreated.
# -----------------------------------------------------------------------------

resource "airtelcloud_baremetal_storage" "this" {
  name              = var.name
  availability_zone = var.availability_zone
  size              = var.size
  description       = var.description
}