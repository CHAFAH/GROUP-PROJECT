resource "aws_instance" "project" {
    ami = var.AMI
    key_name = "SANI"
    instance_type = var.instance_type
    subnet_id = aws_subnet.proj-pub-1.id
    vpc_security_group_ids = [aws_security_group.GrpProject_SG.id]
    tags = {
        Name = "project"
    }
}
output "map_public_ip_on_launch" {
  value = aws_instance.project.public_ip
}