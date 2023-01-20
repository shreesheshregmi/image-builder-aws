variable "common_tags" {

  default = {
    "Name" = "test"
  }
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2A6atSIF8clvPfZSwZTCpMGTlKbBEwNG7WdnjxXGogEcNaL1IPhqDBhLRF3KxF7eGnw2QABakvjZ7rlKsxzuDxrKnq9IlOZ+1Xri2UwsL2yRUIIWfMepGr52wf74WSawc6t7/GAiHsiE/rKFsMnhjN1J+08hPy9pMCzf2UQfuikJnAOqLGGCRH9/bRZJNSkkym0GXBLv/nqwAjXqGMAFrkyLEydcbORbjMtOtDElm32Yn0K4wGPJydkec37Y88HQp7T/6paoj4nxhRYjc/y6bvO6DIwl1B1zaZlRIARETglt9Ptxt4AdsRR16mLgwAzK6RqMqIhD2mxwTuvEFKOjr+jIXKJZCVCMBieH+pYA9lhM5flpOzgUAI6BYx4Iy+vU+R2Kz/E7Mb0SjVQY/ly1GVaLBo7mVAGNWLMZOAxcEm6asgaQn+H8a5IwMABqB14LVP1jYWfRvf3w2KtOrPKxUQ1cDhFt7ABTweQsV4yFsxb6z5PxYhAGVKnag8JwweJ8= user@DESKTOP-QIGL3NS"

}

variable "security_group_ids" {
  default     = ["sg-01039d965a0b145cf", "sg-092694ca2fb0012ed"]
  description = "security group"
}