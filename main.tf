provider "aws" {
  region = "us-east-1"
}

terrafrom {
  backend "s3" {
    bucket  = "one-bucket-s3-testing"
    key     = "testing-onebucket-s3-withterraform.tfstate"
    region  = "us-east-1"
  }
}

resource "aws_s3_bucket" "testbucketone"{
  bucket = "testing-onebucket-s3-withterraform"
  acl    = "public-read"

  policy = <<POLICY
{
      "Id": "PublicAccess"
      "Version": "2012-10-17",
      "Statement": [
        {
         "Action": [
           "s3:GetObject",
         ],
         "Effect": "Allow",
         "Resource": "arn:aws:s3:::testing-onebucket-s3-withterraform/*",
         "Principal": "*"
        }
      ]
    }
    EOF

     website{
       index_document = "index.html"
     }
   }
