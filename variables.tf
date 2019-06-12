variable "aws_configuration" {
  description = "The AWS credentials and configurations"
  type = "map"
  default = {
    "region" = "us-east-1"
    "profile" = "sandbox"
  }
}

variable "s3_bucket_configuration" {
    description = "S3 Bucket Configuration"
    type = "map"
    default = {
      "name" = "Static App"
      "project" = "LF Test"
    }
}

variable "s3_bucket_name" {
  default = "np.com.lftechnology.allstardevops"
}



variable "domain_configuration" {
  description = "Domain Configuration"
  type = "map"
  default = {
    "root_domain" = "lftechnology.com.np"
    "domain" = "allstardevops.lftechnology.com.np"
  }
  
}

