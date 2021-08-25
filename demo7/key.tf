resource "aws_key_pair" "key-madhu" {
  key_name   = "key-madhu"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}