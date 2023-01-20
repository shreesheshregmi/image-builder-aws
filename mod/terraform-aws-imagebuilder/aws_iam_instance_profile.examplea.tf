resource "aws_iam_instance_profile" "examplea" {
  name = var.instance_profile_name
  role = aws_iam_role.ssm.name
}

resource "aws_iam_role" "ssm" {
  name = "imagebuilder_ssm"
  path = "/"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilder",
    "arn:aws:iam::773914189848:policy/AmazonKMSFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"

  
  ]
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

