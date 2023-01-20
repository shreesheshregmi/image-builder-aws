provider "aws" {
  region = "ap-south-1"
}

resource "aws_kms_key" "test" {}

resource "aws_kms_alias" "test" {
  name          = "alias/my-key-alias"
  target_key_id = aws_kms_key.test.key_id
}
data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Test"]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["test-sg"]
  }
}


module "imagebuilder" {
  source             = "./mod/terraform-aws-imagebuilder"
  common_tags        = var.common_tags
  kms_key            = aws_kms_key.test.key_id
  subnet_id          = data.aws_subnet.selected.id
  security_group_ids = [data.aws_security_group.selected.id]
  public_key         = var.public_key
  component = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
}
