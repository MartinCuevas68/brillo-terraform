#• 1 VPC in us-east-1 region. This should be flexible based on region. If no region is provided,  this should be built in us-east-1.  
#• 2 Subnets with high availability supported in 2 zones 
#• 1 Route table not including the default one. Routes should not be routed using the local  route.  
#• Autoscaling group with a flexible cool down, deregistration delay, instance warm up. 
#• 2 EC2 instances created from the autoscaling group 
#• ALB to load-balance the app servers. Ensure the port is flexible based on the application.  
#• IAM roles should only be used by the account owner.
resource "aws_vpc" "this" {
  for_each = var.vpcs

    // required value 
  cidr_block       = each.value.cidr_block

  //Optional values  protocol          = egress.value.protocol != null ? egress.value.protocol : null
  instance_tenancy = each.value.instance_tenancy

  // Optional Values
  ipv4_ipam_pool_id                    = each.value.ipv4_ipam_pool_id != null ? each.value.ipv4_ipam_pool_id : null
  ipv4_netmask_length                  = each.value.ipv4_netmask_length != null ? each.value.ipv4_netmask_length : null
  ipv6_cidr_block                      = each.value.ipv6_cidr_block != null ? each.value.ipv6_cidr_block : null
  ipv6_ipam_pool_id                    = each.value.ipv6_ipam_pool_id != null ? each.value.ipv6_ipam_pool_id : null
  ipv6_netmask_length                  = each.value.ipv6_netmask_length != null ? each.value.ipv6_netmask_length : null
  ipv6_cidr_block_network_border_group = each.value.ipv6_cidr_block_network_border_group != null ? each.value.ipv6_cidr_block_network_border_group : null
  enable_dns_support                   = each.value.enable_dns_support != null ? each.value.enable_dns_support : null
  enable_network_address_usage_metrics = each.value.enable_network_address_usage_metrics != null ? each.value.enable_network_address_usage_metrics : null
  enable_dns_hostnames                 = each.value.enable_dns_hostnames != null ? each.value.enable_dns_hostnames : null
  assign_generated_ipv6_cidr_block     = each.value.assign_generated_ipv6_cidr_block != null ? each.value.assign_generated_ipv6_cidr_block : null
  tags                                 = var.tags
}

resource "aws_subnet" "this" {
  for_each = var.subnets

    //Required Values
    vpc_id                                         = each.value.vpc_id 

    //optional Values
    assign_ipv6_address_on_creation                = each.value.assign_ipv6_address_on_creation != null ? each.value.assign_ipv6_address_on_creation : null
    availability_zone                              = each.value.availability_zone != null ? each.value.availability_zone : null
    availability_zone_id                           = each.value.availability_zone_id != null ? each.value.availability_zone_id : null
    cidr_block                                     = each.value.cidr_block != null ? each.value.cidr_block : null
    customer_owned_ipv4_pool                       = each.value.customer_owned_ipv4_pool != null ? each.value.customer_owned_ipv4_pool : null 
    enable_dns64                                   = each.value.enable_dns64 != null ? each.value.enable_dns64 : null
    enable_lni_at_device_index                     = each.value.enable_lni_at_device_index != null ? each.value.enable_lni_at_device_index : null
    enable_resource_name_dns_aaaa_record_on_launch = each.value.enable_resource_name_dns_aaaa_record_on_launch != null ? each.value.enable_resource_name_dns_aaaa_record_on_launch : null
    enable_resource_name_dns_a_record_on_launch    = each.value.enable_resource_name_dns_a_record_on_launch != null ? each.value.enable_resource_name_dns_a_record_on_launch : null
    ipv6_cidr_block                                = each.value.ipv6_cidr_block != null ? each.value.ipv6_cidr_block : null
    ipv6_native                                    = each.value.ipv6_native != null ? each.value.ipv6_native : null
    map_customer_owned_ip_on_launch                = each.value.map_customer_owned_ip_on_launch != null ? each.value.map_customer_owned_ip_on_launch : null
    map_public_ip_on_launch                        = each.value.map_public_ip_on_launch != null ? each.value.map_public_ip_on_launch : null
    outpost_arn                                    = each.value.outpost_arn != null ? each.value.outpost_arn : null
    private_dns_hostname_type_on_launch            = each.value.private_dns_hostname_type_on_launch != null ? each.value.private_dns_hostname_type_on_launch : null
    tags                                           = var.tags
}

resource "aws_main_route_table_association" "this" {
  for_each = var.route_table
  vpc_id = each.value.vpc_id
  route_table_id = each.value.route_table_id
}
