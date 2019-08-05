resource "aws_iam_role" "read_only" {
  name                 = "${var.account_name}-read-only"
  assume_role_policy   = "${data.aws_iam_policy_document.saml.json}"
  max_session_duration = "${var.role_max_session_duration}"
}

resource "aws_iam_policy_attachment" "read_only" {
  name       = "idp-read-only-attachment"
  roles      = ["${aws_iam_role.read_only.name}"]
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
