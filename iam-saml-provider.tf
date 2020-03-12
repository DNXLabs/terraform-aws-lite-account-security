resource "aws_iam_saml_provider" "saml" {
  name                   = "SAMLProvider"
  saml_metadata_document = var.metadata
}
