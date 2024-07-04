locals {
    project = {
        "eci-project" = {
            description = "Example description of project"
        }
    }
    workspace = {
        "eci-tfe" = {
            description = "Example description of workspace"
            execution_mode    = "local"
            project_id = module.project["eci-project"].id
        }
    }
}