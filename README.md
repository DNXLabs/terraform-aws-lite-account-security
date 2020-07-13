# terraform-aws-lite-account-security

[![Lint Status](https://github.com/DNXLabs/terraform-aws-lite-account-security/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-lite-account-security/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-lite-account-security)](https://github.com/DNXLabs/terraform-aws-lite-account-security/blob/master/LICENSE)

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_alias | Alias for this account | `any` | n/a | yes |
| account\_name | Name for this account (slug) | `any` | n/a | yes |
| extra\_roles | A map of <role\_name> = <json policy> to create extra roles in this account | `map(string)` | `{}` | no |
| idp\_admin\_trust\_names | Names for external IDPs for roles (must match idp\_trusts) | `list(string)` | `[]` | no |
| idp\_admin\_trusts | List of role ARNs to trust as external IDPs | `list(string)` | `[]` | no |
| metadata | Metadata provided by GSuite | `any` | n/a | yes |
| role\_max\_session\_duration | Maximum CLI/API session duration | `string` | `"43200"` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Author
Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-lite-account-security/blob/master/LICENSE) for full details.