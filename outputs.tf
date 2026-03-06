output "contact_id" {
  description = "The ID of the message center contact"
  value       = var.create_contact ? alicloud_msc_sub_contact.contact[0].id : null
}

output "webhook_id" {
  description = "The ID of the message center webhook"
  value       = var.create_webhook ? alicloud_msc_sub_webhook.webhook[0].id : null
}

output "subscription_id" {
  description = "The ID of the message center subscription"
  value       = var.create_subscription ? alicloud_msc_sub_subscription.subscription[0].id : null
}

output "subscription_channel" {
  description = "The channel of the message center subscription"
  value       = var.create_subscription ? alicloud_msc_sub_subscription.subscription[0].channel : null
}

output "subscription_description" {
  description = "The description of the message center subscription"
  value       = var.create_subscription ? alicloud_msc_sub_subscription.subscription[0].description : null
}