output "datascience_model_groups_id" {
  description = "Map of id values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no id are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datascience_model_groups_compartment_id" {
  description = "Map of compartment_id values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no compartment_id are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "datascience_model_groups_create_type" {
  description = "Map of create_type values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no create_type are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.create_type if v.create_type != null && length(v.create_type) > 0 }
}
output "datascience_model_groups_created_by" {
  description = "Map of created_by values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no created_by are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.created_by if v.created_by != null && length(v.created_by) > 0 }
}
output "datascience_model_groups_defined_tags" {
  description = "Map of defined_tags values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no defined_tags are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "datascience_model_groups_description" {
  description = "Map of description values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no description are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.description if v.description != null && length(v.description) > 0 }
}
output "datascience_model_groups_display_name" {
  description = "Map of display_name values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no display_name are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "datascience_model_groups_freeform_tags" {
  description = "Map of freeform_tags values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "datascience_model_groups_lifecycle_details" {
  description = "Map of lifecycle_details values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "datascience_model_groups_member_model_entries" {
  description = "Map of member_model_entries values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no member_model_entries are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => one(v.member_model_entries) if v.member_model_entries != null && length(v.member_model_entries) > 0 }
}
output "datascience_model_groups_model_group_clone_source_details" {
  description = "Map of model_group_clone_source_details values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no model_group_clone_source_details are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => one(v.model_group_clone_source_details) if v.model_group_clone_source_details != null && length(v.model_group_clone_source_details) > 0 }
}
output "datascience_model_groups_model_group_details" {
  description = "Map of model_group_details values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no model_group_details are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => one(v.model_group_details) if v.model_group_details != null && length(v.model_group_details) > 0 }
}
output "datascience_model_groups_model_group_version_history_id" {
  description = "Map of model_group_version_history_id values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no model_group_version_history_id are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.model_group_version_history_id if v.model_group_version_history_id != null && length(v.model_group_version_history_id) > 0 }
}
output "datascience_model_groups_model_group_version_history_name" {
  description = "Map of model_group_version_history_name values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no model_group_version_history_name are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.model_group_version_history_name if v.model_group_version_history_name != null && length(v.model_group_version_history_name) > 0 }
}
output "datascience_model_groups_project_id" {
  description = "Map of project_id values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no project_id are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "datascience_model_groups_source_model_group_id" {
  description = "Map of source_model_group_id values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no source_model_group_id are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.source_model_group_id if v.source_model_group_id != null && length(v.source_model_group_id) > 0 }
}
output "datascience_model_groups_state" {
  description = "Map of state values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no state are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.state if v.state != null && length(v.state) > 0 }
}
output "datascience_model_groups_system_tags" {
  description = "Map of system_tags values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no system_tags are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "datascience_model_groups_time_created" {
  description = "Map of time_created values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no time_created are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "datascience_model_groups_time_updated" {
  description = "Map of time_updated values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no time_updated are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "datascience_model_groups_version_id" {
  description = "Map of version_id values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no version_id are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.version_id if v.version_id != null && length(v.version_id) > 0 }
}
output "datascience_model_groups_version_label" {
  description = "Map of version_label values across all datascience_model_groups, keyed the same as var.datascience_model_groups except keys with no version_label are omitted"
  value       = { for k, v in oci_datascience_model_group.datascience_model_groups : k => v.version_label if v.version_label != null && length(v.version_label) > 0 }
}

