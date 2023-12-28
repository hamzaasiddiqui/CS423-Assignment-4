provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "terraform_csid_devops" {
  name = "terraform-cs423-devops"
}

resource "aws_iam_user_policy_attachment" "admin_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = aws_iam_user.terraform_csid_devops.name
}

resource "aws_iam_access_key" "terraform_csid_devops_key" {
  user = aws_iam_user.terraform_csid_devops.name
}