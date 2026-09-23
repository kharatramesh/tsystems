
# please find out exiting vpc details 

data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["user11-vpc1"]
  }
}



# Find out the latest ami id for amazon linux 2
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# find out ami id for ubuntu 24
data "aws_ami" "latest_ubuntu_24" {
    most_recent = true
    owners      = ["099720109477"]
    
    filter {
        name   = "name"
        # values = ["*ubuntu-noble-24.04*"]
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

resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.latest_ubuntu_24.id
  region        = var.region
  instance_type = var.i_type
  tags = {
    Name = "my-ubuntu-instance"
  }
}

output "latest_ubuntu_24_ami_id" {
    value = data.aws_ami.latest_ubuntu_24.id
}
output "latest_ubuntu_24_ami_name" {
    value = data.aws_ami.latest_ubuntu_24.name
}



# output "latest_amazon_linux_ami_id" {
#   value = data.aws_ami.latest_amazon_linux.id
# }

# output "latest_amazon_linux_ami_name" {
#   value = data.aws_ami.latest_amazon_linux.name
# }

# output "vpc_id" {
#   value = data.aws_vpc.existing.id
# }

# output "vpc_cidr_block" {
#   value = data.aws_vpc.existing.cidr_block
# }
# output "vpc_default" {
#   value = data.aws_vpc.existing.tags
# }