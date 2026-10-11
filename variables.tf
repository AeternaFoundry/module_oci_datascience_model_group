variable "datascience_model_groups" {
  description = <<EOT
Map of datascience_model_groups, attributes below
Required:
    - compartment_id
    - create_type
    - project_id
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - model_group_version_history_id
    - version_label
    - member_model_entries (block):
        - member_model_details (optional, block):
            - inference_key (optional)
            - model_id (optional)
    - model_group_clone_source_details (block):
        - model_group_clone_source_type (required)
        - modify_model_group_details (optional, block):
            - defined_tags (optional)
            - description (optional)
            - display_name (optional)
            - freeform_tags (optional)
            - model_group_details (optional, block):
                - base_model_id (optional)
                - custom_metadata_list (optional, block):
                    - category (optional)
                    - description (optional)
                    - key (optional)
                    - value (optional)
                - type (required)
            - model_group_version_history_id (optional)
            - version_label (optional)
        - patch_model_group_member_model_details (optional, block):
            - items (optional, block):
                - operation (required)
                - values (required, block):
                    - inference_key (optional)
                    - model_id (required)
        - source_id (required)
    - model_group_details (block):
        - base_model_id (optional)
        - custom_metadata_list (optional, block):
            - category (optional)
            - description (optional)
            - key (optional)
            - value (optional)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id                 = string
    create_type                    = string
    project_id                     = string
    defined_tags                   = optional(map(string))
    description                    = optional(string)
    display_name                   = optional(string)
    freeform_tags                  = optional(map(string))
    model_group_version_history_id = optional(string)
    version_label                  = optional(string)
    member_model_entries = optional(object({
      member_model_details = optional(list(object({
        inference_key = optional(string)
        model_id      = optional(string)
      })))
    }))
    model_group_clone_source_details = optional(object({
      model_group_clone_source_type = string
      modify_model_group_details = optional(object({
        defined_tags  = optional(map(string))
        description   = optional(string)
        display_name  = optional(string)
        freeform_tags = optional(map(string))
        model_group_details = optional(object({
          base_model_id = optional(string)
          custom_metadata_list = optional(list(object({
            category    = optional(string)
            description = optional(string)
            key         = optional(string)
            value       = optional(string)
          })))
          type = string
        }))
        model_group_version_history_id = optional(string)
        version_label                  = optional(string)
      }))
      patch_model_group_member_model_details = optional(object({
        items = optional(list(object({
          operation = string
          values = list(object({
            inference_key = optional(string)
            model_id      = string
          }))
        })))
      }))
      source_id = string
    }))
    model_group_details = optional(object({
      base_model_id = optional(string)
      custom_metadata_list = optional(list(object({
        category    = optional(string)
        description = optional(string)
        key         = optional(string)
        value       = optional(string)
      })))
      type = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_groups : (
        v.model_group_clone_source_details == null || (v.model_group_clone_source_details.patch_model_group_member_model_details == null || (v.model_group_clone_source_details.patch_model_group_member_model_details.items == null || alltrue([for item in v.model_group_clone_source_details.patch_model_group_member_model_details.items : (length(item.values) >= 1)])))
      )
    ])
    error_message = "Each values list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_groups : (
        contains([for v in ["CLONE", "CREATE"] : lower(v)], lower(v.create_type))
      )
    ])
    error_message = "must be one of: \"CLONE\", \"CREATE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_groups : (
        v.model_group_clone_source_details == null || (contains([for v in ["MODEL_GROUP", "MODEL_GROUP_VERSION_HISTORY"] : lower(v)], lower(v.model_group_clone_source_details.model_group_clone_source_type)))
      )
    ])
    error_message = "must be one of: \"MODEL_GROUP\", \"MODEL_GROUP_VERSION_HISTORY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_groups : (
        v.model_group_clone_source_details == null || (v.model_group_clone_source_details.modify_model_group_details == null || (v.model_group_clone_source_details.modify_model_group_details.model_group_details == null || (contains([for v in ["HETEROGENEOUS", "HOMOGENEOUS", "STACKED"] : lower(v)], lower(v.model_group_clone_source_details.modify_model_group_details.model_group_details.type)))))
      )
    ])
    error_message = "must be one of: \"HETEROGENEOUS\", \"HOMOGENEOUS\", \"STACKED\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_groups : (
        v.model_group_clone_source_details == null || (v.model_group_clone_source_details.patch_model_group_member_model_details == null || (v.model_group_clone_source_details.patch_model_group_member_model_details.items == null || alltrue([for item in v.model_group_clone_source_details.patch_model_group_member_model_details.items : (contains([for v in ["INSERT", "REMOVE"] : lower(v)], lower(item.operation)))])))
      )
    ])
    error_message = "must be one of: \"INSERT\", \"REMOVE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_groups : (
        v.model_group_details == null || (contains([for v in ["HETEROGENEOUS", "HOMOGENEOUS", "STACKED"] : lower(v)], lower(v.model_group_details.type)))
      )
    ])
    error_message = "must be one of: \"HETEROGENEOUS\", \"HOMOGENEOUS\", \"STACKED\""
  }
}

