output "aws_instance_public_ip" {
  value = aws_instance.web_server[*].public_ip
}

output "aws_instance_id" {
  value = aws_instance.web_server[*].id
}

output "sg_id" {
  value = aws_security_group.wagtail_web_sg.id
}
