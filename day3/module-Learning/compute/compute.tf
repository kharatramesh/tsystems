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

resource "aws_key_pair" "keypair1" {
  key_name   = "trainer-ec2-key"
  public_key = file("C:/Users/ADMIN/.ssh/id_rsa.pub")
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.latest_ubuntu_24.id
    instance_type = var.itype
    subnet_id = var.subnet_id
    availability_zone = var.azone
    key_name = aws_key_pair.keypair1.key_name
    security_groups = [ var.sgname ]
    tags = {
        Name = "Ec2-trainer"
    }
    # provisioner "local-exec" {
    #   command = "echo Learning Modules with Provisioners >> index.html"
    # }

    provisioner "file" {
      source = "index.html"
      destination = "/tmp/index.html"
    }
    provisioner "file" {
      source = "web.sh"
      destination = "/tmp/web.sh" 
    }
    provisioner "remote-exec" {
      inline = [ 

        "sudo setfacl -m u:ubuntu:rwx /var/www/html/",
        "sudo setfacl -m u:ubuntu:rwx /tmp/",
        "sudo chmod +x /tmp/web.sh",
        "sudo /tmp/web.sh",
        "sudo cp /tmp/index.html /var/www/html/"
       ]
    }
    connection {
      type = "ssh"
      user = "ubuntu"
      host = self.public_ip
      timeout = "3m"
      private_key = file("C:/Users/ADMIN/.ssh/id_rsa")
    }

}