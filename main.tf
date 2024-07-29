terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias  = "new"
  region = "us-west-1"
}


resource "aws_iam_user" "user1" {
  name = "ama-konadu"
  path = "/system/"

  tags = {
    tag-key = "ama-konadu"
  }
}


data "aws_iam_policy_document" "fuse" {
  statement {
    effect = "Allow"
    actions = ["s3:ListAllMyBuckets",
      "s3:DescribeJob",
    "s3:GetAccessGrant"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy1" {
  name   = "s3-policyy"
  path   = "/"
  policy = data.aws_iam_policy_document.fuse.json
}

resource "aws_iam_user_policy_attachment" "policy-attach" {
  user       = aws_iam_user.user1.name
  policy_arn = aws_iam_policy.policy1.arn
}

resource "aws_iam_user_policy_attachment" "policy-attach1" {
  user       = aws_iam_user.user1.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_instance" "server1" {
  ami           = "ami-0c38b837cd80f13bb"
  instance_type = "t2.micro"

  tags = {
    Name = "ama-server1"
  }
}

resource "aws_instance" "server2" {
  ami = "ami-0ff591da048329e00"
  provider = aws.new
  instance_type = "t2.micro"
  

  tags = {
    Name = "ama-server2"
  }
}

output "iam_user_id" {
  value = aws_iam_user.user1.id
}

output "ec2_publicip" {
  value = aws_instance.server1.associate_public_ip_address
    
  }

  