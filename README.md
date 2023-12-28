# ebraekke/oci-secure-base

TODO: Clean up doc. 

Repo for defining secrets with Resource Manager (RM)

## Download the latest version of the Resource Manager ready stack from the releases section

Or you can just click the button below.

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/ebraekke/oci-secure-base/releases/download/v0.9.0-alpha.1/oci-secure-base_0.9.0.zip)

## Session based authentication

Provide the name of the session created using `oci cli session autenticate` in the variable `oci_cli_profile`.

## Required input parameters

```hcl
variable "set_name" {
    description = "The name of or role of this set, used as base for naming, typicall test/dev/qa"
}

variable "compartment_ocid"     {
    description = "ocid of compartment"
}
```

## Default parameters

The following "default" parameters need to be passed to the oci terraform provider.

```hcl
variable "region"               { default = "eu-stockholm-1"}
variable "oci_cli_profile"      {
    description = "name of oci cli profile used for session based auth"
    default     = "nosearn"
}
variable "tenancy_ocid"         {}
```

## Create 

```bash
terraform plan --out=oci-secure-base.tfplan --var-file=config/vars_arn.tfvars

terraform apply "oci-secure-base.tfplan"
```

## Resource Manager

### Create a release 

Perform these operations from the top level folder in repo. 

Remember to add Linux to lock file.
```bash
terraform providers lock -platform=linux_amd64
```

Create ZIP archive, add non-tracked file from config dir.
```bash
git archive --add-file config\provider.tf --format=zip HEAD -o .\config\test_rel.zip
```

### Create stack

```bash
$C = "ocid1.compartment.oc1..somehashlikestring"
$config_source  = "C:\Users\espenbr\GitHub\oci-secure-base\config\test_rel.zip"
$variables_file = "C:/Users/espenbr/GitHub/oci-secure-base/config/vars_arn.json"
$disp_name = "DEV 1.Secure base"
$desc = "DEV 1 oci-secure-base RM"
$wait_spec="--wait-for-state=ACTIVE"

oci resource-manager stack create --config-source=$config_source --display-name="$disp_name" --description="$desc" --variables=file://$variables_file -c $C --terraform-version=1.2.x $wait_spec
```
