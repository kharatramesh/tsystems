data "aws_ami" "latest_ubuntu_24" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20260610"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.latest_ubuntu_24.id
    instance_type = var.itype
    subnet_id = var.subnet_id
    availability_zone = var.azone
    # vpc_security_group_ids = var.sg
    tags = {
        Name = "Ec2-trainer"
    }
}