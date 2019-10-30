provider "rancher2" {
  api_url = "https://51.15.206.221/v3"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
}

resource "rancher_environment" "demo" {
  name = "blog-demo"
  description = "Demonstration environment"
  orchestration = "cattle"
}
