module "baremetal_storage" {
  source = "../../"

  name              = "basic-storage"
  availability_zone = "S1"
  size              = 10
}