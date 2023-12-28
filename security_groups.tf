resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.devops_vpc.id
  # Define inbound and outbound rules
}

resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "HTTP, HTTPS, and SSH access"
  vpc_id      = aws_vpc.devops_vpc.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH access from your IP (replace with your IP address)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic - open to all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_server_sg"
  }
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "cs423_assignment4"
  public_key = file("~/.ssh/cs423_assignment4.pub")
}