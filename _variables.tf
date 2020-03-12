variable "account_name" {
  description = "Name for this account (slug)"
}
variable "account_alias" {
  description = "Alias for this account"
}
variable "metadata" {
  description = "Metadata provided by GSuite"
}

variable "role_max_session_duration" {
  description = "Maximum CLI/API session duration"
  default     = "43200"
}

variable "extra_roles" {
  type        = map(string)
  default     = {}
  description = "A map of <role_name> = <json policy> to create extra roles in this account"
}

variable "idp_admin_trusts" {
  type        = list(string)
  description = "List of role ARNs to trust as external IDPs"
  default     = []
}

variable "idp_admin_trust_names" {
  type        = list(string)
  description = "Names for external IDPs for roles (must match idp_trusts)"
  default     = []
}