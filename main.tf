variable "rancher2_access_key" {}
variable "rancher2_secret_key" {}
provider "rancher2" {
  api_url = "https://51.15.206.221/v3"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
  insecure = true
}

data "rancher2_cluster" "quickstart" {
  name = "quickstart"
}
