locals {
  project = {
    "eci-project" = {
      description = "Example description of project"
    }
  }
  workspace = {
    "eci-tfe" = {
      description         = "Automation Workspace for Terraform Resources"
      execution_mode      = "remote"
      project_id          = module.project["eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/eci-terraform-tfe"
    },
    "eci-github" = {
      description         = "Automation Workspace for Github Resources"
      execution_mode      = "remote"
      project_id          = module.project["eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/eci-terraform-github"
    }

    "eci-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/eci-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "eci"
        },
      ]
    }

    "eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/eci-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "<your-top-level-domain>"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "eci-<your-name>"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "eci"
        },
      ]
    }
  }
}