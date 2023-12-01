

module "vault" {
    source              = "./modules/vault"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-vault"
}

## MySQL password
module "secret" {
    source              = "./modules/secret"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-mysql-secret"
    description         = "${var.set_name}-mysql-secret: passowrd for MySQL"
    vault_ocid          = module.vault.vault_ocid
    content             = local.mysql_password
    key_ocid            = module.vault.vault_master_key_ocid
}
