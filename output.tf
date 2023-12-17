output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
//*********************************//
output "pub_subnet_id" {
 value = aws_subnet.my_public_subnet.*.id
}
output "pri_subnet_id" {
value = aws_subnet.my_private_subnet.*.id
}
