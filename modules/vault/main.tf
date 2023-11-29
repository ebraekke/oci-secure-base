
resource oci_kms_vault my_vault {
    compartment_id = var.compartment_ocid
    display_name = var.display_name

    vault_type = "DEFAULT"
}

resource oci_kms_key my_master_key {
    compartment_id = var.compartment_ocid
    desired_state = "ENABLED"
    display_name  = "${var.display_name}-master-key"
    key_shape {
        algorithm = "AES"
        curve_id  = ""
        length    = "32"
    }

    management_endpoint = data.oci_kms_vault.my_vault.management_endpoint
    protection_mode     = "SOFTWARE"

    lifecycle {
        prevent_destroy = true
    }
}
