output "aws_instance_public_ip" {
  value = aws_instance.web_server[*]
}

output "aws_instance_id" {
  value = aws_instance.web_server[*]
}

output "sg_id" {
  value = aws_security_group.wagtail_web_sg.id
}
