output "instance_IP_Address" {
    value = aws_instance.ec2.public_ip
}
output "Instance_ID" {
    value = aws_instance.ec2.id
}