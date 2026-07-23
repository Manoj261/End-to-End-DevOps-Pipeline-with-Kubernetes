resource "aws_instance" "K8-M" {
  ami           = "ami-0aa47c25091df3f7b"
  instance_type = "t3.small"
  key_name      = "AWS_Key"
  security_groups = ["launch-wizard-3"]

  tags = {
    Name = "K8-M"
  }
}

resource "aws_instance" "K8-S1" {
  ami           = "ami-0aa47c25091df3f7b"
  instance_type = "t3.small"
  key_name      = "AWS_Key"
  security_groups = ["launch-wizard-3"]

  tags = {
    Name = "K8-S1"
  }
}

resource "aws_instance" "K8-S2" {
  ami           = "ami-0aa47c25091df3f7b"
  instance_type = "t3.small"
  key_name      = "AWS_Key"
  security_groups = ["launch-wizard-3"]

  tags = {
    Name = "K8-S2"
  }
}
