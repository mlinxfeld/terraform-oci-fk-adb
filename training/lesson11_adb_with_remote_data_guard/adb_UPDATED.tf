module "oci-fk-adb-primary" {
  providers = {
    oci = oci.primary
  }
  #source                                = "github.com/mlinxfeld/terraform-oci-fk-adb"
  source                                = "../../"
  adb_database_db_name                  = "FoggyKitchenADB"
  adb_database_display_name             = "FoggyKitchenADB_Source"
  adb_password                          = var.adb_password
  adb_database_db_workload              = "OLTP" # Autonomous Transaction Processing (ATP)
  adb_free_tier                         = false
  adb_database_cpu_core_count           = 1
  adb_database_data_storage_size_in_tbs = 1
  compartment_ocid                      = var.compartment_ocid
  use_existing_vcn                      = false
  adb_private_endpoint                  = true
}

module "oci-fk-adb-remote-standby" {
  providers = {
    oci = oci.standby
  }
  #source                                = "github.com/mlinxfeld/terraform-oci-fk-adb"
  source                                = "../../"
  adb_database_db_name                  = "FoggyKitchenADB"
  adb_database_display_name             = "FoggyKitchenADB_Standby"
  adb_database_db_workload              = "OLTP" # Autonomous Transaction Processing (ATP)
  adb_free_tier                         = false
  adb_database_cpu_core_count           = 1
  adb_database_data_storage_size_in_tbs = 1
  compartment_ocid                      = var.compartment_ocid
  use_existing_vcn                      = false
  adb_private_endpoint                  = true
  adb_private_endpoint_label            = "fkadbpe2"
  source_id                             = module.oci-fk-adb-primary.adb_database.adb_database_id
  source_type                           = "CROSS_REGION_DISASTER_RECOVERY"
  remote_disaster_recovery_type         = "ADG"  
}



