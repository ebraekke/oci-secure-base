
resource oci_kms_vault my_vault {
    compartment_id = var.compartment_ocid
    display_name = var.display_name

    vault_type = "DEFAULT"
}

resource oci_kms_key hy_master_key {
    compartment_id = var.compartment_ocid
    desired_state = "ENABLED"
    display_name  = "arn-vault-master-key"
    key_shape {
        algorithm = "AES"
        curve_id  = ""
        length    = "32"
    }

    management_endpoint = data.oci_kms_vault.test_vault.management_endpoint
    protection_mode     = "SOFTWARE"
}

/*
resource oci_kms_key export_arn-vault-master-key {
  compartment_id = var.compartment_ocid
  defined_tags = {
  }
  desired_state = "ENABLED"
  display_name  = "arn-vault-master-key"
  #external_key_reference = <<Optional value not found in discovery>>
  freeform_tags = {
  }
  key_shape {
    algorithm = "AES"
    curve_id  = ""
    length    = "32"
  }
  management_endpoint = "https://gzscyarpaacbi-management.kms.eu-stockholm-1.oci.oraclecloud.com"
  protection_mode     = "SOFTWARE"
  #restore_from_file = <<Optional value not found in discovery>>
  #restore_from_object_store = <<Optional value not found in discovery>>
  #restore_trigger = <<Optional value not found in discovery>>
  #time_of_deletion = <<Optional value not found in discovery>>
}

resource oci_kms_key_version export_arn-vault-master-key_key_version {
  #external_key_version_id = <<Optional value not found in discovery>>
  key_id              = "ocid1.key.oc1.eu-stockholm-1.gzscyarpaacbi.abqxeljrsi5fesgtusxv6fxah2pmh7natjvg3wkkiigadfuvzelqbgy5yo6q"
  management_endpoint = "https://gzscyarpaacbi-management.kms.eu-stockholm-1.oci.oraclecloud.com"
  #time_of_deletion = <<Optional value not found in discovery>>
}

*/