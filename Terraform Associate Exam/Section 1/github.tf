provider "github" {
  token = "token"
}

resource "github_repository" "terraform_test" {
  name        = "terraform_test"

  visibility = "private"


}
