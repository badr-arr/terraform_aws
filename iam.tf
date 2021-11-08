resource "aws_iam_role" "tf_instance_iam_role" {
  name = "tf_instance_iam_role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": "ec2.amazonaws.com"
        },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "tf_instance_profile" {
  name = "tf_instance_profile"
  role = aws_iam_role.tf_instance_iam_role.name
}

resource "aws_iam_role_policy" "tf_iam_role_policy" {
  name        = "tf_iam_role_policy"
  role        = "${aws_iam_role.tf_instance_iam_role.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
           "Sid": "",
           "Effect": "Allow",
           "Action": [
             "s3:Put*",
             "s3:Delete*"
           ],
           "Resource": [
              "arn:aws:s3:::tf-data-test/can_be_written/*"
           ]
        }
    ]
}
EOF
}