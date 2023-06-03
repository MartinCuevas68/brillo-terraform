
provider "aws" {
  region     = local.region != null ? local.region : "us-east-1"
}

module "vpcs_module" {
  source = "../modules/VPC"

  region      = local.region
  vpcs        = local.vpcs
  subnets     = local.subnets
  tags        = local.tags
  route_table = local.route_table

}
