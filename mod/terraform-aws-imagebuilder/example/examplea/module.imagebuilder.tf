module "imagebuilder" {
  source             = "../../"
  common_tags        = var.common_tags
  # kms_key            = aws_kms_key.imagebuilder
  # subnet_id          = var.subnet_id
  subnet_id          = data.aws_subnet.default
  security_group_ids = var.security_group_ids
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

data "aws_subnet" "default" {

  CIDR = "172.31.16.0/20"
}