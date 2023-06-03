# This is where you put your variables declaration
locals {

    environment = "DEV"
    lab_name    = "brilio"
    region = null


     vpcs = {
        "vpc" = {
           cidr_block = "10.0.0.0/16"
            tags = local.tags
        },
    }

    subnets = {
        "subnet_1" = {
            vpc_id            = module.vpcs_module.output_vpc_id
            cidr_block                          = "10.0.0.0/24"
            availability_zone = "us-east-1a"
            tags = local.tags
        },
         "subnet_2" = {
            vpc_id            = module.vpcs_module.output_vpc_id
            cidr_block        = "10.0.1.0/24"
            availability_zone = "us-east-1b"
            tags              = local.tags
        },
    }

    route_table = {

        "vpc" = {
            vpc_id = module.vpcs_module.output_vpc_id
            route_table_id = module.vpcs_module.output_vpc_id
        }

    }


    tags = {
        Environment = local.environment
        LabName     = local.lab_name
        ManagedBy   = "Terraform"
    }

}