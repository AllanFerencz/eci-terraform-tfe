terraform {
  cloud {
    organization = "allanferencz"

    workspaces {
      name = "eci-tfe"
    }
  }
}