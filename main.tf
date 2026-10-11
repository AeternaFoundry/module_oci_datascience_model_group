resource "oci_datascience_model_group" "datascience_model_groups" {
  for_each = var.datascience_model_groups

  compartment_id                 = each.value.compartment_id
  create_type                    = each.value.create_type
  project_id                     = each.value.project_id
  defined_tags                   = each.value.defined_tags
  description                    = each.value.description
  display_name                   = each.value.display_name
  freeform_tags                  = each.value.freeform_tags
  model_group_version_history_id = each.value.model_group_version_history_id
  version_label                  = each.value.version_label

  dynamic "member_model_entries" {
    for_each = each.value.member_model_entries != null ? [each.value.member_model_entries] : []
    content {
      dynamic "member_model_details" {
        for_each = member_model_entries.value.member_model_details != null ? member_model_entries.value.member_model_details : []
        content {
          inference_key = member_model_details.value.inference_key
          model_id      = member_model_details.value.model_id
        }
      }
    }
  }

  dynamic "model_group_clone_source_details" {
    for_each = each.value.model_group_clone_source_details != null ? [each.value.model_group_clone_source_details] : []
    content {
      model_group_clone_source_type = model_group_clone_source_details.value.model_group_clone_source_type
      dynamic "modify_model_group_details" {
        for_each = model_group_clone_source_details.value.modify_model_group_details != null ? [model_group_clone_source_details.value.modify_model_group_details] : []
        content {
          defined_tags  = modify_model_group_details.value.defined_tags
          description   = modify_model_group_details.value.description
          display_name  = modify_model_group_details.value.display_name
          freeform_tags = modify_model_group_details.value.freeform_tags
          dynamic "model_group_details" {
            for_each = modify_model_group_details.value.model_group_details != null ? [modify_model_group_details.value.model_group_details] : []
            content {
              base_model_id = model_group_details.value.base_model_id
              dynamic "custom_metadata_list" {
                for_each = model_group_details.value.custom_metadata_list != null ? model_group_details.value.custom_metadata_list : []
                content {
                  category    = custom_metadata_list.value.category
                  description = custom_metadata_list.value.description
                  key         = custom_metadata_list.value.key
                  value       = custom_metadata_list.value.value
                }
              }
              type = model_group_details.value.type
            }
          }
          model_group_version_history_id = modify_model_group_details.value.model_group_version_history_id
          version_label                  = modify_model_group_details.value.version_label
        }
      }
      dynamic "patch_model_group_member_model_details" {
        for_each = model_group_clone_source_details.value.patch_model_group_member_model_details != null ? [model_group_clone_source_details.value.patch_model_group_member_model_details] : []
        content {
          dynamic "items" {
            for_each = patch_model_group_member_model_details.value.items != null ? patch_model_group_member_model_details.value.items : []
            content {
              operation = items.value.operation
              dynamic "values" {
                for_each = items.value.values
                content {
                  inference_key = values.value.inference_key
                  model_id      = values.value.model_id
                }
              }
            }
          }
        }
      }
      source_id = model_group_clone_source_details.value.source_id
    }
  }

  dynamic "model_group_details" {
    for_each = each.value.model_group_details != null ? [each.value.model_group_details] : []
    content {
      base_model_id = model_group_details.value.base_model_id
      dynamic "custom_metadata_list" {
        for_each = model_group_details.value.custom_metadata_list != null ? model_group_details.value.custom_metadata_list : []
        content {
          category    = custom_metadata_list.value.category
          description = custom_metadata_list.value.description
          key         = custom_metadata_list.value.key
          value       = custom_metadata_list.value.value
        }
      }
      type = model_group_details.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

