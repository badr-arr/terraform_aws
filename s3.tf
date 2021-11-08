resource "aws_s3_bucket" "tf-data-test" {
  bucket = "tf-data-test"
  acl    = "private"

  lifecycle {
    prevent_destroy = true
  }
}