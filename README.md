# Airtel Cloud Baremetal Storage Terraform Module

This Terraform module creates and manages a baremetal block storage volume on Airtel Cloud.

The module provides a simple interface for provisioning block storage that can be used with Airtel Cloud baremetal workloads.

## Usage

### Basic

```hcl
module "baremetal_storage" {
  source = "Airtel-Cloud-Platform/baremetal-storage/airtelcloud"

  name              = "basic-storage"
  availability_zone = "S1"
  size              = 10
}
```

### Complete

```hcl
module "baremetal_storage" {
  source = "Airtel-Cloud-Platform/baremetal-storage/airtelcloud"

  name              = "application-data"
  availability_zone = "S1"
  size              = 100
  description       = "100 GB storage volume for application data"
}
```

## Requirements

| Name                  | Version  |
| --------------------- | -------- |
| Terraform             | >= 1.0   |
| Airtel Cloud Provider | Required |

## Inputs

| Name                | Description                                                                                 | Type     | Required | Default |
| ------------------- | ------------------------------------------------------------------------------------------- | -------- | -------- | ------- |
| `name`              | The name of the baremetal block storage volume. The name must be unique within the project. | `string` | Yes      | n/a     |
| `availability_zone` | The availability zone where the baremetal block storage volume will be provisioned.         | `string` | Yes      | n/a     |
| `size`              | The size of the baremetal block storage volume in GB.                                       | `number` | Yes      | n/a     |
| `description`       | An optional description for the baremetal block storage volume.                             | `string` | No       | `null`  |

## Outputs

| Name                 | Description                                                                 |
| -------------------- | --------------------------------------------------------------------------- |
| `id`                 | The unique identifier of the baremetal block storage volume.                |
| `state`              | The current state of the baremetal block storage volume.                    |
| `failed_state_error` | The error message associated with the volume when it enters a failed state. |
| `created_at`         | The timestamp when the baremetal block storage volume was created.          |
| `created_by`         | The user who created the baremetal block storage volume.                    |
| `uuid`               | The UUID assigned to the baremetal block storage volume.                    |
| `provider_volume_id` | The provider-specific identifier of the underlying storage volume.          |

## Module Behavior

The following attributes are immutable:

* `name`
* `availability_zone`
* `size`

Changing any of these values will cause Terraform to destroy and recreate the storage volume.

The `description` argument is optional and can be used to provide additional information about the storage volume.

## Availability Zone

The `availability_zone` argument determines where the storage volume is provisioned.

For example:

```hcl
availability_zone = "S1"
```

The availability zone should correspond to the baremetal workload with which the storage volume will be used.

Changing the availability zone forces the storage volume to be recreated.

## Storage Size

The `size` argument specifies the capacity of the storage volume in **GB**.

For example:

```hcl
size = 100
```

This creates a 100 GB baremetal block storage volume.

Changing the size forces the storage volume to be recreated.

## Description

The `description` argument is optional and can be used to provide additional information about the storage volume.

For example:

```hcl
description = "100 GB storage volume for application data"
```

## Import

An existing baremetal storage volume can be imported using its volume name.

If the module is declared as:

```hcl
module "baremetal_storage" {
  source = "Airtel-Cloud-Platform/baremetal-storage/airtelcloud"

  name              = "application-data"
  availability_zone = "S1"
  size              = 100
}
```

the resource can be imported using:

```bash
terraform import module.baremetal_storage.airtelcloud_baremetal_storage.this <volume-name>
```

After importing the resource, run:

```bash
terraform plan
```

to verify that the Terraform configuration matches the existing storage volume.

## Example Directory Structure

```text
examples/
├── basic/
│   └── main.tf
└── complete/
    └── main.tf
```

### Basic Example

```hcl
module "baremetal_storage" {
  source = "Airtel-Cloud-Platform/baremetal-storage/airtelcloud"

  name              = "basic-storage"
  availability_zone = "S1"
  size              = 10
}
```

### Complete Example

```hcl
module "baremetal_storage" {
  source = "Airtel-Cloud-Platform/baremetal-storage/airtelcloud"

  name              = "application-data"
  availability_zone = "S1"
  size              = 100
  description       = "100 GB storage volume for application data"
}
```

## Notes

* The storage volume is provisioned in the specified availability zone.
* The storage volume size is specified in GB.
* The storage volume name must be unique within the project.
* Changing `name`, `availability_zone`, or `size` forces the storage volume to be recreated.
* The `description` argument is optional.
* The `state` output provides the current state of the storage volume.
* The `failed_state_error` output provides the error message when the storage volume enters a failed state.
* The `uuid` output provides the UUID assigned to the storage volume.
* The `provider_volume_id` output provides the provider-specific identifier of the underlying storage volume.
