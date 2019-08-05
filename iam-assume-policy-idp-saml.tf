data "aws_iam_policy_document" "saml" {
  statement = {
    principals = {
      type = "Federated"

      identifiers = [
        "${aws_iam_saml_provider.saml.arn}",
      ]
    }

    actions = [
      "sts:AssumeRoleWithSAML",
    ]

    condition = {
      test     = "StringEquals"
      variable = "SAML:aud"

      values = [
        "https://signin.aws.amazon.com/saml",
      ]
    }
  }
}
