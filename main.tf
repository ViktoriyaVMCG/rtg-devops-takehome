provider "aws"{
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "rtg-gatsby-bucket"
    key    = "rtg-homeassign.com.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = "rtg-homeassign.com"
  acl    = "public-read"
  
  policy = <<EOF
 {  
      "Id": "MakePublic",
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
          "s3:GetObject"
        ],
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::rtg-homeassign/*"
          "Principal": "*"
        }
       ]
      }
   EOF  
   
   website {
     index_document = "index.html"
   }  
}
