provider "github" {
  token = "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"
}

resource "github_repository" "terraform_test" {
  name        = "terraform_test"

  visibility = "private"


}