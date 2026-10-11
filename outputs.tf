output "sagemaker_workteams_id" {
  description = "Map of id values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_workteams_arn" {
  description = "Map of arn values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_workteams_description" {
  description = "Map of description values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.description if v.description != null && length(v.description) > 0 }
}
output "sagemaker_workteams_member_definition" {
  description = "Map of member_definition values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.member_definition if v.member_definition != null && length(v.member_definition) > 0 }
}
output "sagemaker_workteams_notification_configuration" {
  description = "Map of notification_configuration values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => one(v.notification_configuration) if v.notification_configuration != null && length(v.notification_configuration) > 0 }
}
output "sagemaker_workteams_region" {
  description = "Map of region values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_workteams_subdomain" {
  description = "Map of subdomain values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.subdomain if v.subdomain != null && length(v.subdomain) > 0 }
}
output "sagemaker_workteams_tags" {
  description = "Map of tags values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "sagemaker_workteams_tags_all" {
  description = "Map of tags_all values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "sagemaker_workteams_worker_access_configuration" {
  description = "Map of worker_access_configuration values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => one(v.worker_access_configuration) if v.worker_access_configuration != null && length(v.worker_access_configuration) > 0 }
}
output "sagemaker_workteams_workforce_name" {
  description = "Map of workforce_name values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.workforce_name if v.workforce_name != null && length(v.workforce_name) > 0 }
}
output "sagemaker_workteams_workteam_name" {
  description = "Map of workteam_name values across all sagemaker_workteams, keyed the same as var.sagemaker_workteams"
  value       = { for k, v in aws_sagemaker_workteam.sagemaker_workteams : k => v.workteam_name if v.workteam_name != null && length(v.workteam_name) > 0 }
}

