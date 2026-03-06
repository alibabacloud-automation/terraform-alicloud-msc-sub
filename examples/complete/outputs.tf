output "contact_id" {
  description = "The ID of the created contact"
  value       = module.msc_sub.contact_id
}

output "webhook_id" {
  description = "The ID of the created webhook"
  value       = module.msc_sub.webhook_id
}

output "subscription_id" {
  description = "The ID of the created subscription"
  value       = module.msc_sub.subscription_id
}

output "subscription_channel" {
  description = "The channel of the created subscription"
  value       = module.msc_sub.subscription_channel
}

output "subscription_description" {
  description = "The description of the created subscription"
  value       = module.msc_sub.subscription_description
}

output "available_subscriptions" {
  description = "List of available subscription items - use these item_name values when creating subscriptions"
  value       = data.alicloud_msc_sub_subscriptions.available.subscriptions
}

output "example_subscription_item_names" {
  description = "Example subscription item names you can use"
  value = [
    for item in data.alicloud_msc_sub_subscriptions.available.subscriptions :
    item.item_name if can(item.item_name)
  ]
}