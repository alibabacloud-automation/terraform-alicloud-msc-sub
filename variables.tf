variable "create_contact" {
  type        = bool
  description = "Whether to create a message center contact"
  default     = true
}

variable "contact_config" {
  type = object({
    contact_name = string
    position     = string
    email        = string
    mobile       = string
  })
  description = "Configuration for message center contact. The contact_name must be 2 to 12 characters in length. Valid position values are: CEO, Technical Director, Maintenance Director, Project Director, Finance Director, Other."
  default = {
    contact_name = null
    position     = null
    email        = null
    mobile       = null
  }
}

variable "create_webhook" {
  type        = bool
  description = "Whether to create a message center webhook"
  default     = false
}

variable "webhook_config" {
  type = object({
    server_url   = string
    webhook_name = string
  })
  description = "Configuration for message center webhook. The server_url must start with https://oapi.dingtalk.com/robot/send?access_token=. The webhook_name must be 2 to 12 characters in length."
  default = {
    server_url   = null
    webhook_name = null
  }
}

variable "create_subscription" {
  type        = bool
  description = "Whether to create a message center subscription"
  default     = false
}

variable "subscription_config" {
  type = object({
    item_name      = string
    sms_status     = optional(string, "0")
    email_status   = optional(string, "0")
    pmsg_status    = optional(string, "0")
    tts_status     = optional(string, "0")
    webhook_status = optional(string, "0")
    contact_ids    = optional(set(string), [])
    webhook_ids    = optional(set(string), [])
  })
  description = "Configuration for message center subscription. The item_name should be queried using alicloud_msc_sub_subscriptions data source. Status values can be: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed)."
  default = {
    item_name = null
  }
}