variable "rancher2_access_key" {}
variable "rancher2_secret_key" {}
variable "rancher2_url" {}

provider "rancher2" {
  api_url = "${var.rancher2_url}"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
  insecure = true
}

data "rancher2_cluster" "sandbox" {
  name = "sandbox"
}
