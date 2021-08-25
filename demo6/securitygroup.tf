data "aws_ip_ranges" "ip" {
  regions = ["us-west-2"]
  services = ["ec2"]
}

resource "aws_security_group" "from_us" {
  name = "from_us"

  ingress {
    from_port = "443"
    protocol = "tcp"
    to_port = "443"
    cidr_blocks = data.aws_ip_ranges.ip.cidr_blocks
  }
  tags = {
    CreateDate = data.aws_ip_ranges.ip.create_date
    SyncToken = data.aws_ip_ranges.ip.sync_token
  }
}