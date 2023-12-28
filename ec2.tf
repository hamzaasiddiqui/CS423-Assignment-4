# EC2 Instance for Web Server
resource "aws_instance" "web_server_assignment4" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer_key.key_name
  subnet_id     = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = ["sg-065e1db9d809f4e65"]

  user_data = file("${path.module}/scripts/user_data.sh")

  tags = {
    Name = "Assignment4-EC2-Web"
  }
}

# EC2 Instance for Database
resource "aws_instance" "database_assignment4" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer_key.key_name
  subnet_id     = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = ["sg-065e1db9d809f4e65"]

  user_data = file("${path.module}/scripts/user_data.sh")

  tags = {
    Name = "Assignment4-EC2-DBML"
  }
}