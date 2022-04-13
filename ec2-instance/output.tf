output "ec2_instance_ip" {
  value = aws_instance.ec2_instance[*].private_ip
}