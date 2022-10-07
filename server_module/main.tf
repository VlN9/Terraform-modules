data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

data "aws_key_pair" "my_key" {}

resource "aws_instance" "web_server" {
  count                  = var.count_instances
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups
  key_name               = data.aws_key_pair.my_key.key_name
  user_data              = var.user_data
  user_data_replace_on_change = var.replace_userdata_on_change
  
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_config
    content {
      delete_on_termination = ebs_block_device.value["ebs_delete_on_termination"]
      device_name           = ebs_block_device.value["ebs_device_name"]
      encrypted             = ebs_block_device.value["ebs_encrypted"]
      kms_key_id            = ebs_block_device.value["ebs_kms_key_id"]
      snapshot_id           = ebs_block_device.value["ebs_snapshot_id"]
      volume_size           = ebs_block_device.value["ebs_volume_size"]
      volume_type           = ebs_block_device.value["ebs_volume_type"]
    }
  }
  
  tags = { 
    Name    = "${var.env}-WebServer-${count.index + 1}" 
    Owner   = var.owner
    Project = var.project    
    }
}
