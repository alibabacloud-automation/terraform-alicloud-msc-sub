阿里云消息中心订阅管理 Terraform 模块

# terraform-alicloud-msc-sub

[English](https://github.com/alibabacloud-automation/terraform-alicloud-msc-sub/blob/main/README.md) | 简体中文

在阿里云上创建和管理消息中心 (MSC) 订阅资源的 Terraform 模块。此模块帮助您为云资源设置全面的通知管理，使您能够通过多种渠道（包括短信、邮件、钉钉 Webhook 和站内消息）接收重要的告警和通知。消息中心服务为各种阿里云服务提供集中的通知管理，帮助您及时了解关键事件、资源状态变更和整个云基础设施的系统告警。

## 使用方法

此模块允许您创建和管理消息中心联系人、Webhook 和订阅。您可以根据运维需求配置不同的通知渠道和订阅偏好。

```terraform
module "msc_sub" {
  source = "alibabacloud-automation/msc-sub/alicloud"

  # 创建用于接收通知的联系人
  create_contact = true
  contact_config = {
    contact_name = "ops-team"
    position     = "Technical Director"
    email        = "ops@company.com"
    mobile       = "13800138000"
  }

  # 创建钉钉 Webhook 用于通知
  create_webhook = true
  webhook_config = {
    server_url   = "https://oapi.dingtalk.com/robot/send?access_token=your-token"
    webhook_name = "ops-webhook"
  }

  # 创建产品到期通知订阅
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

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-msc-sub/tree/main/examples/complete)

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
| <a name="input_contact_config"></a> [contact\_config](#input\_contact\_config) | Configuration for message center contact. The contact_name must be 2 to 12 characters in length. Valid position values are: CEO, Technical Director, Maintenance Director, Project Director, Finance Director, Other. | <pre>object({<br>    contact_name = string<br>    position     = string<br>    email        = string<br>    mobile       = string<br>  })</pre> | <pre>{<br>  "contact_name": null,<br>  "email": null,<br>  "mobile": null,<br>  "position": null<br>}</pre> | no |
| <a name="input_create_contact"></a> [create\_contact](#input\_create\_contact) | Whether to create a message center contact | `bool` | `true` | no |
| <a name="input_create_subscription"></a> [create\_subscription](#input\_create\_subscription) | Whether to create a message center subscription | `bool` | `false` | no |
| <a name="input_create_webhook"></a> [create\_webhook](#input\_create\_webhook) | Whether to create a message center webhook | `bool` | `false` | no |
| <a name="input_subscription_config"></a> [subscription\_config](#input\_subscription\_config) | Configuration for message center subscription. The item_name should be queried using alicloud_msc_sub_subscriptions data source. Status values can be: -1 (required), -2 (banned), 0 (not subscribed), 1 (subscribed). | <pre>object({<br>    item_name      = string<br>    sms_status     = optional(string, "0")<br>    email_status   = optional(string, "0")<br>    pmsg_status    = optional(string, "0")<br>    tts_status     = optional(string, "0")<br>    webhook_status = optional(string, "0")<br>    contact_ids    = optional(set(string), [])<br>    webhook_ids    = optional(set(string), [])<br>  })</pre> | <pre>{<br>  "item_name": null<br>}</pre> | no |
| <a name="input_webhook_config"></a> [webhook\_config](#input\_webhook\_config) | Configuration for message center webhook. The server_url must start with https://oapi.dingtalk.com/robot/send?access_token=. The webhook_name must be 2 to 12 characters in length. | <pre>object({<br>    server_url   = string<br>    webhook_name = string<br>  })</pre> | <pre>{<br>  "server_url": null,<br>  "webhook_name": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_contact_id"></a> [contact\_id](#output\_contact\_id) | The ID of the message center contact |
| <a name="output_subscription_channel"></a> [subscription\_channel](#output\_subscription\_channel) | The channel of the message center subscription |
| <a name="output_subscription_description"></a> [subscription\_description](#output\_subscription\_description) | The description of the message center subscription |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | The ID of the message center subscription |
| <a name="output_webhook_id"></a> [webhook\_id](#output\_webhook\_id) | The ID of the message center webhook |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)