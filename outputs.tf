output "adb_database" {
  value = {
    adb_database_id     = oci_database_autonomous_database.fk_adb_database.id
    connection_urls     = oci_database_autonomous_database.fk_adb_database.connection_urls
    adb_wallet_content  = oci_database_autonomous_database_wallet.fk_adb_database_wallet.content
    adb_nsg_id          = (!var.use_existing_vcn && var.adb_private_endpoint) ? oci_core_network_security_group.fk_adb_nsg[0].id : var.adb_nsg_id
    private_endpoint_ip = var.adb_private_endpoint ? join(",", oci_database_autonomous_database.fk_adb_database[*].private_endpoint_ip) : ""
  }
}



