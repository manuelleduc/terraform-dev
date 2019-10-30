variable "rancher2_access_key" {}
variable "rancher2_secret_key" {}
variable "rancher2_url" {}

provider "rancher2" {
  api_url = "${var.rancher2_url}"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
  insecure = true
}

data "rancher2_cluster" "quickstart" {
  name = "sandbox"
}

##############
#ROLES
##############
data "rancher2_role_template" "View_Volumes" {
  name = "View Volumes"
}

data "rancher2_role_template" "View_Workloads" {
  name = "View Workloads"
}

data "rancher2_role_template" "View_Services" {
  name = "View Services"
}

data "rancher2_role_template" "View_Service_Accounts" {
  name = "View Service Accounts"
}

data "rancher2_role_template" "View_Project_Members" {
  name = "View Project Members"
}

data "rancher2_role_template" "View_Project_Catalogs" {
  name = "View Project Catalogs"
}

data "rancher2_role_template" "View_Ingress" {
  name = "View Ingress"
}

data "rancher2_role_template" "View_Config_Maps" {
  name = "View Config Maps"
}


# Create a new rancher2 project Role Template
resource "rancher2_role_template" "Project_Guest" {
  name = "Guest"
  context = "project"
  default_role = false
  description = "allows users to see what is going on only"
  role_template_ids = [
      "${data.rancher2_role_template.View_Config_Maps.id}", 
      "${data.rancher2_role_template.View_Ingress.id}",
      "${data.rancher2_role_template.View_Project_Catalogs.id}",
      "${data.rancher2_role_template.View_Project_Members.id}",
      "${data.rancher2_role_template.View_Service_Accounts.id}",
      "${data.rancher2_role_template.View_Services.id}",
      "${data.rancher2_role_template.View_Volumes.id}",
      "${data.rancher2_role_template.View_Workloads.id}"
      ]
}



#####################
# Projects
#####################
resource "rancher2_project" "Titans" {
  name = "Titans"
  cluster_id = "${data.rancher2_cluster.quickstart.id}"
}

resource "rancher2_project" "Avengers" {
  name = "Avengers"
  cluster_id = "${data.rancher2_cluster.quickstart.id}"
}

resource "rancher2_project" "Platform" {
  name = "Platform"
  cluster_id = "${data.rancher2_cluster.quickstart.id}"
}
