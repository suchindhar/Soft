terraform {
  backend "s3" {
    bucket = "terraform-4-21-23"
    key = "main"
    region = "ap-south-1"
  }
}
