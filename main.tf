provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "mediawiki-ec2-sg" {
  name        = "mediawiki-ec2-sg"
  description = "Allows http https and ssh access"
  vpc_id      = "vpc-d5bb80af"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




variable subnets {
  type    = list
  default = ["abcd-123", "a-1234", "c-12345"]
}

locals {
  subnetvalue4 = formatlist("%s:5000", var.subnets)
  subnet_value5 = join(",", local.subnetvalue4)
}

variable test{
  default = 3
}

variable test2{
  default =4
}

resource "random_shuffle" "subnets" {
  input        = "${var.subnets}"
  result_count = 1
}

output "subnet_values" {
  value = "${var.subnets}"
}

output "subnetvalue1" {
  value = "${var.test2 - var.test}"
}

output "subnetvalue2" {
  value = "${element(var.subnets, 1)}"
}
output "subnetvalue3" {
  value = join(", ", ["test1", "test2", "test3", "test4"])
}

output "joined_subnet" {
  value = local.subnet_value5
}


output "subnetvalue5" {
  value = "${element(var.subnets, 5)}"
}

output "subnetvalue6" {
  value = "${element(var.subnets, 6)}"
}

output "subnetvalue7" {
  value = "${element(var.subnets, 7)}"
}
