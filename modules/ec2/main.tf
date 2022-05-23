provider "aws" {
region = var.region
}

data "aws_ami"  "ubuntu" {
most_recent = true
filter {
name = "name"
values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}
filter {
name = "virtualization-type"
values = ["hvm"]
}
owners = ["099720109477"]

}

resource "aws_instance" "web" {
ami = data.aws_ami.ubuntu.id
subnet_id = var.subnet_id[0]
tags = var.additional_tags
instance_type = var.instance_type
vpc_security_group_ids = var.vpc_security_group_idsc
user_data = "${file("./assets/scripts/install_nginx.sh")}"
key_name = "rolands_jankovskis"
}
