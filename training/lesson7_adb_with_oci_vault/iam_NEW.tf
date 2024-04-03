resource "oci_identity_dynamic_group" "FoggyKitchenDynamicGroup" {
  provider       = oci.homeregion
  name           = "FoggyKitchenDynamicGroup"
  description    = "FoggyKitchen Dynamic Group"
  compartment_id = var.tenancy_ocid
  matching_rule  = "All {resource.compartment.id = '${var.compartment_ocid}'}"
}

resource "oci_identity_policy" "FoggyKitchenPolicy" {
  provider       = oci.homeregion
  depends_on     = [oci_identity_dynamic_group.FoggyKitchenDynamicGroup]
  name           = "FoggyKitchenPolicy"
  description    = "FoggyKitchen Policy (use of OCI Vault in tenancy)"
  compartment_id = var.tenancy_ocid
  statements     = [
    "Allow dynamic-group ${oci_identity_dynamic_group.FoggyKitchenDynamicGroup.name} to use vaults in tenancy",
    "Allow dynamic-group ${oci_identity_dynamic_group.FoggyKitchenDynamicGroup.name} to use keys in tenancy",
  ]
}