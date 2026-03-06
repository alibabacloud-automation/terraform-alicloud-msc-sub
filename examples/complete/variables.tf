variable "contact_name" {
  type        = string
  description = "The name of the contact (2-12 characters)"
  default     = "tfex"
}

variable "contact_position" {
  type        = string
  description = "The position of the contact. Valid values: CEO, Technical Director, Maintenance Director, Project Director, Finance Director, Other"
  default     = "Other"
}

variable "contact_email" {
  type        = string
  description = "The email address of the contact"
  default     = "terraform@example.com"
}

variable "contact_mobile" {
  type        = string
  description = "The mobile phone number of the contact (Chinese mobile format)"
  default     = "13900000000"
}

variable "create_webhook" {
  type        = bool
  description = "Whether to create a webhook"
  default     = false
}

variable "webhook_server_url" {
  type        = string
  description = "The server URL of the webhook"
  default     = null
}

variable "webhook_name" {
  type        = string
  description = "The name of the webhook"
  default     = null
}

variable "create_subscription" {
  type        = bool
  description = "Whether to create a subscription"
  default     = false
}

variable "subscription_item_name" {
  type        = string
  description = "The name of the subscription item. Common values: 'Notifications of Product Expiration', 'Notifications of Overdue Payment', etc. Query available items using alicloud_msc_sub_subscriptions data source"
  default     = null
}

variable "sms_status" {
  type        = string
  description = "The SMS status of the subscription. Values: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed)"
  default     = "0"
}

variable "email_status" {
  type        = string
  description = "The email status of the subscription. Values: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed)"
  default     = "1"
}

variable "pmsg_status" {
  type        = string
  description = "The internal message status of the subscription. Values: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed)"
  default     = "0"
}

variable "tts_status" {
  type        = string
  description = "The voice notification status of the subscription. Values: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed)"
  default     = "0"
}

variable "webhook_status" {
  type        = string
  description = "The webhook status of the subscription. Values: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed)"
  default     = "0"
}

variable "contact_ids" {
  type        = set(string)
  description = "The IDs of the contacts for subscription"
  default     = []
}

variable "webhook_ids" {
  type        = set(string)
  description = "The IDs of the webhooks for subscription"
  default     = []
}