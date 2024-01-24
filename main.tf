

## Vault
module "vault" {
    source              = "./modules/vault"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-vault"
}

## MySQL admin password
module "mysql_secret" {
    source              = "./modules/secret"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-mysql-secret"
    description         = "${var.set_name}-mysql-secret: password for MySQL"
    vault_ocid          = module.vault.vault_ocid
    content             = base64encode(local.mysql_password)
    key_ocid            = module.vault.vault_master_key_ocid
}

## MongoDB admin password
module "mongo_secret" {
    source              = "./modules/secret"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-mongo-secret"
    description         = "${var.set_name}-mongo-secret: password for MongoDB (ADB)"
    vault_ocid          = module.vault.vault_ocid
    content             = base64encode(local.mongo_password)
    key_ocid            = module.vault.vault_master_key_ocid
}

## SSH key
module "ssh_secret" {
    source              = "./modules/secret"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-ssh-secret"
    description         = "${var.set_name}-ssh-secret: ssh secret for hosts"
    vault_ocid          = module.vault.vault_ocid
    content             = base64encode(tls_private_key.the_ssh_key.private_key_openssh)
    key_ocid            = module.vault.vault_master_key_ocid
}

