provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "testbucketone"{
  bucket = "testing-onebucket-s3-withterraform"
  acl    = "private"
}
