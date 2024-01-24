
# generate password, this resource creates warnings if you try to output 
resource "random_password" "exposed_password" {

  # https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingpasswordrules.htm
  length           = 16
  special          = true
  override_special = "!#_"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "random_password" "mysql_password" {

  # https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingpasswordrules.htm
  length           = 16
  special          = true
  override_special = "!#_"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "random_password" "mongo_password" {

  # https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingpasswordrules.htm
  length           = 16
  special          = true
  override_special = "!#_"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

# Maybe not clean, but put here
resource "tls_private_key" "the_ssh_key" {
  algorithm = "ECDSA"
}

locals {
  exposed_password = random_password.exposed_password.result

  mysql_password  = random_password.mysql_password.result
  mongo_password  = random_password.mongo_password.result
}
