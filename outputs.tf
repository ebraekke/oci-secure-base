
/* uncomment for debugging -- not needed otherwise
*/

output "ads" {
  value = data.oci_identity_availability_domains.ads
}

output "dasigret" {
  value = local.password
  sensitive = true
}
