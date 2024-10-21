resource "aws_instance" "bastion" {
  ami           = "ami-054a53dca63de757b"
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  key_name = "cluster-configuration"

  associate_public_ip_address = true

  tags = {
    Name = "Bastion-Host"
  }
}