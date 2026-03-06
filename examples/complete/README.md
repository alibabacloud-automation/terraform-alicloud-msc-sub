# Complete Example

This example demonstrates the complete usage of the Terraform AliCloud MSC Sub module, including creating a message center contact, webhook, and subscription. This example is based on the official provider documentation examples for `alicloud_msc_sub_contact` and `alicloud_msc_sub_subscription`.

## Overview

This example shows how to:
1. Create a message center contact for receiving notifications
2. (Optional) Create a DingTalk webhook for team notifications
3. Create subscriptions to specific notification items
4. Query available subscription items using data source

## Usage

### Step 1: Create Contact Only

First, create a contact. The contact needs to be verified before you can use it in subscriptions:

```bash
$ terraform init
$ terraform plan
$ terraform apply -target=module.msc_sub.alicloud_msc_sub_contact.contact[0]
```

After creation, verify the contact through the verification message sent to the email/mobile.

### Step 2: Create Subscription (Optional)

Once the contact is verified, you can create subscriptions by setting variables:

```bash
$ terraform apply -var="create_subscription=true" -var="subscription_item_name=Notifications of Product Expiration"
```

### Step 3: Full Apply

To create all resources:

```bash
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| alicloud | >= 1.132.0 |

## Providers

| Name | Version |
|------|---------|
| alicloud | >= 1.132.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| contact_name | The name of the contact | `string` | `"terraform-example"` | no |
| contact_position | The position of the contact | `string` | `"Technical Director"` | no |
| contact_email | The email of the contact | `string` | `"terraform@example.com"` | no |
| contact_mobile | The mobile phone number of the contact | `string` | `"13800138000"` | no |
| create_webhook | Whether to create a webhook | `bool` | `false` | no |
| webhook_server_url | The server URL of the webhook | `string` | `null` | no |
| webhook_name | The name of the webhook | `string` | `null` | no |
| create_subscription | Whether to create a subscription | `bool` | `false` | no |
| subscription_item_name | The name of the subscription item | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| contact_id | The ID of the created contact |
| webhook_id | The ID of the created webhook |
| subscription_id | The ID of the created subscription |
| subscription_channel | The channel of the created subscription |
| subscription_description | The description of the created subscription |
| available_subscriptions | List of available subscription items |

## Notes

### Contact Resource
1. The contact will be created by default with the provided contact information.
2. **Important**: You must verify the contact using the verification message sent to the email/mobile after creation.
3. Contact name must be 2 to 12 characters in length.
4. Valid position values are: `CEO`, `Technical Director`, `Maintenance Director`, `Project Director`, `Finance Director`, `Other`.

### Webhook Resource (Optional)
1. To create a webhook, set `create_webhook = true` and provide the `webhook_server_url`.
2. The `server_url` must start with `https://oapi.dingtalk.com/robot/send?access_token=`.
3. Webhook name must be 2 to 12 characters in length.

### Subscription Resource
1. To create a subscription, set `create_subscription = true` and provide the `subscription_item_name`.
2. **Important**: The contact must be verified before it can be used in a subscription.
3. You can query available subscription items using the `alicloud_msc_sub_subscriptions` data source.
4. Common subscription item names:
   - `Notifications of Product Expiration`
   - `Notifications of Overdue Payment`
   - `Notifications of Product Release or Upgrade`
5. Status values for subscriptions:
   - `-1`: Required (cannot be changed)
   - `-2`: Banned (cannot be changed)
   - `0`: Not subscribed
   - `1`: Subscribed
6. To link contacts/webhooks to subscriptions, pass their IDs via `contact_ids` and `webhook_ids`.

## Example Scenarios

### Scenario 1: Basic Contact Creation (Beginner)
This is the simplest use case, matching the `101-msc-sub-contact-docs-Example` from provider documentation:

```bash
terraform apply
```

This will create only a contact with default settings.

### Scenario 2: Contact + Subscription (Beginner)
This matches the `101-msc-sub-subscription-docs-Example` from provider documentation:

```bash
terraform apply -var="create_subscription=true" -var="subscription_item_name=Notifications of Product Expiration"
```

This will create a contact and subscribe to product expiration notifications via email.