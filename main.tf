
module "vault" {
    source              = "./modules/vault"

    compartment_ocid    = var.compartment_ocid
    display_name        = "${var.set_name}-vault"
}
