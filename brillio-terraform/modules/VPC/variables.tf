variable "tags" {
  type        = map(string)
  description = "Tags map to be setted on the resource"
} 
variable "region" {
  type        = string
  description = "Tags map to be setted on the resource"
  default = "us-east-1"
} 

variable "vpcs" {
  type = map(object({
    cidr_block                           = string
    instance_tenancy                     = optional(string)
    ipv4_ipam_pool_id                    = optional(string)
    ipv4_netmask_length                  = optional(number)
    ipv6_cidr_block                      = optional(string)
    ipv6_ipam_pool_id                    = optional(string)
    ipv6_netmask_length                  = optional(number)
    ipv6_cidr_block_network_border_group = optional(string)
    enable_dns_support                   = optional(bool)
    enable_network_address_usage_metrics = optional(bool)
    enable_dns_hostnames                 = optional(bool)
    assign_generated_ipv6_cidr_block     = optional(bool)
    tags                                 = optional(map(string))
  }))
}

variable "subnets" {
  type = map(object({
    vpc_id                                         = string
    assign_ipv6_address_on_creation                = optional(bool)
    availability_zone                              = optional(string)
    availability_zone_id                           = optional(string)
    cidr_block                                     = optional(string)
    customer_owned_ipv4_pool                       = optional(string)
    enable_dns64                                   = optional(bool)
    enable_lni_at_device_index                     = optional(number)
    enable_resource_name_dns_aaaa_record_on_launch = optional(bool)
    enable_resource_name_dns_a_record_on_launch    = optional(bool)
    ipv6_cidr_block                                = optional(string)
    ipv6_native                                    = optional(bool)
    map_customer_owned_ip_on_launch                = optional(bool)
    map_public_ip_on_launch                        = optional(bool)
    outpost_arn                                    = optional(string)
    private_dns_hostname_type_on_launch            = optional(string)
    tags                                           = optional(map(string))
  }))
}

variable "route_table" {
  type = map(object({
    vpc_id = string
    route_table_id = string

  }))
}