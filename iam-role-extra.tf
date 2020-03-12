resource "aws_iam_role" "extra" {
  count = length(keys(var.extra_roles))

  name                 = "${var.account_name}-${element(keys(var.extra_roles), count.index)}"
  assume_role_policy   = data.aws_iam_policy_document.saml.json
  max_session_duration = var.role_max_session_duration
}

resource "aws_iam_role_policy" "extra" {
  count = length(keys(var.extra_roles))

  name   = "idp-${element(keys(var.extra_roles), count.index)}-access"
  role   = aws_iam_role.extra.*.id[count.index]
  policy = element(values(var.extra_roles), count.index)
}
