resource "aws_s3_bucket" "bucket" {
    bucket = "${var.s3_bucket_name}"
    acl = "public-read"
    tags {
        Name = "${var.s3_bucket_configuration["name"]}"
        Project = "${var.s3_bucket_configuration["project"]}"

    }
    force_destroy = true
    website {
    index_document = "index.html"
    error_document = "index.html"
  }
    policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.s3_bucket_name}/*"]
    }
  ]
}
POLICY
}
