resource "aws_security_group" "demo7-allow-ssh" {
  vpc_id      = aws_vpc.demo7.id
  name        = "demo7-allow-ssh"
  description = "Security group that allow all ssh and egress traffic"
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "demo7-allow-ssh"
  }
}

