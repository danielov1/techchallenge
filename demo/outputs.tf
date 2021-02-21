output "server_1_ip" {
  value = aws_eip.challenge_eip1.public_ip
}
# output "server_2_ip" {
#   value = aws_eip.challenge_eip2.public_ip
# }

output "vpc" {
  value = aws_vpc.prod
}

output "vpc_id" {
  value = aws_vpc.prod.id
}