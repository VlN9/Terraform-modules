output "aws_instance_public_ip" {
  value = aws_instance.web_server[*].public_ip
}

output "aws_instance_id" {
  value = aws_instance.web_server[*].id
}
output "aws_instanse_prvt_ip" {
  value = aws_instance.web_server[*].private_ip
}