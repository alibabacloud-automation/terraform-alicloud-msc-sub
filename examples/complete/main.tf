# Query available subscription items
data "alicloud_msc_sub_subscriptions" "available" {
}

# Example: Create a message center contact
module "msc_sub" {
  source = "../../"

  # Contact configuration - This will create a contact for receiving notifications
  create_contact = true
  contact_config = {
    contact_name = var.contact_name
    position     = var.contact_position
    email        = var.contact_email
    mobile       = var.contact_mobile
  }

  # Webhook configuration - Optional: Create a DingTalk webhook
  create_webhook = var.create_webhook
  webhook_config = {
    server_url   = var.webhook_server_url
    webhook_name = var.webhook_name
  }

  # Subscription configuration - Subscribe to notification items
  # Note: Contact must be created and verified before creating subscriptions
  create_subscription = var.create_subscription
  subscription_config = {
    item_name      = var.subscription_item_name != null ? var.subscription_item_name : try(data.alicloud_msc_sub_subscriptions.available.subscriptions[0].item_name, null)
    sms_status     = var.sms_status
    email_status   = var.email_status
    pmsg_status    = var.pmsg_status
    tts_status     = var.tts_status
    webhook_status = var.webhook_status
    contact_ids    = length(var.contact_ids) > 0 ? var.contact_ids : []
    webhook_ids    = length(var.webhook_ids) > 0 ? var.webhook_ids : []
  }
}