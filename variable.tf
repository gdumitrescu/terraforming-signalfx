variable "access_token" {
  description = "Splunk Access Token"
  type        = string
}

variable "realm" {
  description = "Splunk Realm"
  type        = string
}

variable "sfx_prefix" {
  type        = string
  description = "Prefix"
  default     = "[Splunk]"
}