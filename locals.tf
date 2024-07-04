locals {
    project = {
        "eci-project" = {
            description = "Example description of project"
        }
    }
    workspace = {
        "eci-tfe" = {
            description = "Example description of workspace"
            execution_mode    = "remote"
            project_id = module.project["eci-project"].id
            vcs_repo_identifier = "AllanFerencz/eci-terraform-tfe"
        }
    }
}