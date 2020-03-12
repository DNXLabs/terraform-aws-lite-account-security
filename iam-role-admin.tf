resource "aws_iam_role" "admin" {
  name                 = "${var.account_name}-admin"
  assume_role_policy   = data.aws_iam_policy_document.saml.json
  max_session_duration = var.role_max_session_duration
}

data "aws_iam_policy_document" "admin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "admin" {
  name   = "admin"
  role   = aws_iam_role.admin.id
  policy = data.aws_iam_policy_document.admin_policy.json
}
