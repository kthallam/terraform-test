variable subnets {
  type    = "list"
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
