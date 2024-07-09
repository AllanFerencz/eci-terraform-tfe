locals {
    project = {
        "eci-project" = {
            description = "Example description of project"
        }
    }
    workspace = {
        "eci-tfe" = {
            description = "Automation Workspace for Terraform Resources"
            execution_mode    = "remote"
            project_id = module.project["eci-project"].id
            vcs_repo_identifier = "${var.github_organization_name}/eci-terraform-tfe"
        },
        "eci-github" = {
            description = "Automation Workspace for Github Resources"
            execution_mode    = "local"
            project_id = module.project["eci-project"].id
            vcs_repo_identifier = "${var.github_organization_name}/eci-terraform-github"
        }
    }
}