# Contact resource for Message Center
resource "alicloud_msc_sub_contact" "contact" {
  count        = var.create_contact ? 1 : 0
  contact_name = var.contact_config.contact_name
  position     = var.contact_config.position
  email        = var.contact_config.email
  mobile       = var.contact_config.mobile
}

# Webhook resource for Message Center
resource "alicloud_msc_sub_webhook" "webhook" {
  count        = var.create_webhook ? 1 : 0
  server_url   = var.webhook_config.server_url
  webhook_name = var.webhook_config.webhook_name
}

# Subscription resource for Message Center
resource "alicloud_msc_sub_subscription" "subscription" {
  count          = var.create_subscription ? 1 : 0
  item_name      = var.subscription_config.item_name
  sms_status     = var.subscription_config.sms_status
  email_status   = var.subscription_config.email_status
  pmsg_status    = var.subscription_config.pmsg_status
  tts_status     = var.subscription_config.tts_status
  webhook_status = var.subscription_config.webhook_status
  contact_ids    = var.subscription_config.contact_ids
  webhook_ids    = var.subscription_config.webhook_ids
}