
# Variables 
variable "set_name" {
    description = "The name of or role of this set, used as base for naming, typicall test/dev/qa"
}

variable "region"               {}

variable "tenancy_ocid"         {}

variable "compartment_ocid"     {
    description = "ocid of compartment"
}

variable "oci_cli_profile"      { 
    default     = "nosearn" 
    description = "name of oci cli profile used for session based auth"
}
