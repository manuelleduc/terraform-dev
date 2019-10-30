provider "rancher2" {
  api_url = "https://51.15.206.221/v3"
  access_key = "${rancher2_access_key}"
  secret_key = "${rancher2_secret_key}"
}

resource "rancher2_environment" "demo" {
  name = "blog-demo"
  description = "Demonstration environment"
  orchestration = "cattle"
}
