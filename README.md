# pc-eventbridge-wrapper

Wrapper module for AWS EventBridge (CloudWatch Events).

## Source

This wrapper uses the upstream module from [`terraform-aws-modules/eventbridge/aws`](https://registry.terraform.io/modules/terraform-aws-modules/eventbridge/aws/latest) version ~> 4.3 and adds local naming, common tags, region/environment defaults, owner="pc".

## Usage

```hcl
module "example_eventbridge" {
  source = "./pc-eventbridge-wrapper"

  region = "ap-south-1"
  environment = "dev"
  
  rules = {
    my-rule = {
      description = "Example rule"
      schedule_expression = "rate(5 minutes)"
    }
  }
  
  targets = {
    my-rule = [
      {
        name = "lambda-target"
        arn  = "arn:aws:lambda:ap-south-1:123:function:my-fn"
      }
    ]
  }
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create EventBridge resources | `bool` | (from upstream) |
| `region` | AWS Region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"Dev"` |
| `bus_name` | EventBridge bus name. Auto-generated as pc-<bus>-<region>-<env>-bus if empty | `string` | `""` |
| `rules` | Map of EventBridge rules | `any` | `{}` |
| `targets` | Map of rule targets | `any` | `{}` |
<!-- Abbrev; many attach_policy*, connections, pipes, schedules etc. See variables.tf --> |

Full inputs: [variables.tf](variables.tf).

## Outputs

| Name | Description |
|------|-------------|
| `eventbridge_bus_arn` | The EventBridge Bus ARN |
| `eventbridge_rule_arns` | The EventBridge Rule ARNs |
| `eventbridge_role_arn` | The ARN of the IAM role created for EventBridge |
| `eventbridge_schedule_arns` | The EventBridge Schedule ARNs |
<!-- Abbrev; full in outputs.tf --> |

## Notes

- Auto-generates bus/role names with owner="pc".
- Common tags: `{Environment, Github_repo=pc-eventbridge-wrapper}`.
- Default region `ap-south-1`, env `Dev`.
- Supports buses, rules/targets, schedules, pipes, API destinations, IAM roles/policies.

