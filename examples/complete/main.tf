module "baremetal_storage" {
  source = "../../"

  name              = "application-data"
  availability_zone = "S1"
  size              = 100
  description       = "100 GB storage volume for application data"
}