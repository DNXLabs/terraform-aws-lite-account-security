
data "aws_iam_policy_document" "assume_role_ci_deploy_ec2" {
  statement {
    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

resource "aws_iam_role" "ci_deploy_ec2" {
  name               = "ci-deploy-ec2"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ci_deploy_ec2.json
}

resource "aws_iam_instance_profile" "ci_deploy_ec2" {
  name = "ci-deploy"
  role = aws_iam_role.ci_deploy_ec2.name
}

resource "aws_iam_user" "ci_deploy" {
  name = "ci-deploy"
}

data "aws_iam_policy_document" "ci_deploy_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "ci_deploy" {
  name   = "ci-deploy"
  role   = aws_iam_role.ci_deploy_ec2.id
  policy = data.aws_iam_policy_document.ci_deploy_policy.json
}

resource "aws_iam_user_policy_attachment" "ci_admin" {
  user       = aws_iam_user.ci_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
