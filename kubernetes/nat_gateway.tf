resource "aws_instance" "private_instance" {
  ami                    = "ami-054a53dca63de757b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_1.id
  key_name               = "dev_ops_user_key"
  security_groups        = [aws_security_group.private_sg.id]

  tags = {
    Name = "private-instance"
  }
}