terraform {
  backend "s3" {
    bucket = "terraform-state-madhu"
    key    = "terraform/statefile"
  }
}