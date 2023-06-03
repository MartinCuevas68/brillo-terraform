output "output_vpc_id" {
  value = aws_vpc.this["vpc"].id
}

output "output_vpc_route_table" {
  value = aws_vpc.this["vpc"].default_route_table_id
}