Terraform Module for Alibaba Cloud Message Center Subscription Management

# terraform-alicloud-msc-sub

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-msc-sub/blob/main/README-CN.md)

Terraform module which creates and manages Message Center (MSC) subscription resources on Alibaba Cloud. This module helps you set up comprehensive notification management for your cloud resources, enabling you to receive important alerts and notifications through multiple channels including SMS, email, DingTalk webhooks, and internal messages. The Message Center service provides centralized notification management for various Alibaba Cloud services, helping you stay informed about critical events, resource status changes, and system alerts across your cloud infrastructure.

## Usage

This module allows you to create and manage Message Center contacts, webhooks, and subscriptions. You can configure different notification channels and subscription preferences based on your operational requirements.

```terraform
module "msc_sub" {
  source = "alibabacloud-automation/msc-sub/alicloud"

  # Create a contact for receiving notifications
  create_contact = true
  contact_config = {
    contact_name = "ops-team"
    position     = "Technical Director"
    email        = "ops@company.com"
    mobile       = "13800138000"
  }

  # Create a DingTalk webhook for notifications
  create_webhook = true
  webhook_config = {
    server_url   = "https://oapi.dingtalk.com/robot/send?access_token=your-token"
    webhook_name = "ops-webhook"
  }

  # Create a subscription for product expiration notifications
  create_subscription = true
  subscription_config = {
    item_name      = "Notifications of Product Expiration"
    sms_status     = "1"
    email_status   = "1"
    pmsg_status    = "1"
    tts_status     = "0"
    webhook_status = "1"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-msc-sub/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.132.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.132.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_msc_sub_contact.contact](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/msc_sub_contact) | resource |
| [alicloud_msc_sub_subscription.subscription](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/msc_sub_subscription) | resource |
| [alicloud_msc_sub_webhook.webhook](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/msc_sub_webhook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contact_config"></a> [contact\_config](#input\_contact\_config) | Configuration for message center contact. The contact\_name must be 2 to 12 characters in length. Valid position values are: CEO, Technical Director, Maintenance Director, Project Director, Finance Director, Other. | <pre>object({<br/>    contact_name = string<br/>    position     = string<br/>    email        = string<br/>    mobile       = string<br/>  })</pre> | <pre>{<br/>  "contact_name": null,<br/>  "email": null,<br/>  "mobile": null,<br/>  "position": null<br/>}</pre> | no |
| <a name="input_create_contact"></a> [create\_contact](#input\_create\_contact) | Whether to create a message center contact | `bool` | `true` | no |
| <a name="input_create_subscription"></a> [create\_subscription](#input\_create\_subscription) | Whether to create a message center subscription | `bool` | `false` | no |
| <a name="input_create_webhook"></a> [create\_webhook](#input\_create\_webhook) | Whether to create a message center webhook | `bool` | `false` | no |
| <a name="input_subscription_config"></a> [subscription\_config](#input\_subscription\_config) | Configuration for message center subscription. The item\_name should be queried using alicloud\_msc\_sub\_subscriptions data source. Status values can be: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed). | <pre>object({<br/>    item_name      = string<br/>    sms_status     = optional(string, "0")<br/>    email_status   = optional(string, "0")<br/>    pmsg_status    = optional(string, "0")<br/>    tts_status     = optional(string, "0")<br/>    webhook_status = optional(string, "0")<br/>    contact_ids    = optional(set(string), [])<br/>    webhook_ids    = optional(set(string), [])<br/>  })</pre> | <pre>{<br/>  "item_name": null<br/>}</pre> | no |
| <a name="input_webhook_config"></a> [webhook\_config](#input\_webhook\_config) | Configuration for message center webhook. The server\_url must start with https://oapi.dingtalk.com/robot/send?access_token=. The webhook\_name must be 2 to 12 characters in length. | <pre>object({<br/>    server_url   = string<br/>    webhook_name = string<br/>  })</pre> | <pre>{<br/>  "server_url": null,<br/>  "webhook_name": null<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_contact_id"></a> [contact\_id](#output\_contact\_id) | The ID of the message center contact |
| <a name="output_subscription_channel"></a> [subscription\_channel](#output\_subscription\_channel) | The channel of the message center subscription |
| <a name="output_subscription_description"></a> [subscription\_description](#output\_subscription\_description) | The description of the message center subscription |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | The ID of the message center subscription |
| <a name="output_webhook_id"></a> [webhook\_id](#output\_webhook\_id) | The ID of the message center webhook |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)