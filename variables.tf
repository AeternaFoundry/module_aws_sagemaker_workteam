variable "sagemaker_workteams" {
  description = <<EOT
Map of sagemaker_workteams, attributes below
Required:
    - description
    - workteam_name
    - member_definition (block):
        - cognito_member_definition (optional, block):
            - client_id (required)
            - user_group (required)
            - user_pool (required)
        - oidc_member_definition (optional, block):
            - groups (required)
Optional:
    - region
    - tags
    - tags_all
    - workforce_name
    - notification_configuration (block):
        - notification_topic_arn (optional)
    - worker_access_configuration (block):
        - s3_presign (optional, block):
            - iam_policy_constraints (optional, block):
                - source_ip (optional)
                - vpc_source_ip (optional)
EOT

  type = map(object({
    description    = string
    workteam_name  = string
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    workforce_name = optional(string)
    member_definition = list(object({
      cognito_member_definition = optional(object({
        client_id  = string
        user_group = string
        user_pool  = string
      }))
      oidc_member_definition = optional(object({
        groups = set(string)
      }))
    }))
    notification_configuration = optional(object({
      notification_topic_arn = optional(string)
    }))
    worker_access_configuration = optional(object({
      s3_presign = optional(object({
        iam_policy_constraints = optional(object({
          source_ip     = optional(string)
          vpc_source_ip = optional(string)
        }))
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_workteams : (
        length(v.member_definition) >= 1 && length(v.member_definition) <= 10
      )
    ])
    error_message = "Each member_definition list must contain between 1 and 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_workteams : (
        alltrue([for item in v.member_definition : (item.oidc_member_definition == null || (alltrue([for x in item.oidc_member_definition.groups : length(x) >= 1 && length(x) <= 63])))])
      )
    ])
    error_message = "must be between 1 and 63 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_workteams : (
        (length(v.workteam_name) >= 1 && length(v.workteam_name) <= 63) && (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z])*$", v.workteam_name)))
      )
    ])
    error_message = "all of: must be between 1 and 63 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

