resource "aws_instance" "demo7-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id = aws_subnet.demo7-public-1.id

  vpc_security_group_ids = [aws_security_group.demo7-allow-ssh.id]

  key_name = aws_key_pair.key-madhu.key_name
}

resource "aws_ebs_volume" "demo7-ebs-volume" {
  availability_zone = "eu-west-1a"
  size              = 2
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "demo7-ebs-volume-attach" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.demo7-instance.id
  volume_id   = aws_ebs_volume.demo7-ebs-volume.id
}