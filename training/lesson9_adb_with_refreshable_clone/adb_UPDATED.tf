module "oci-fk-adb-source" {
  #source                                = "github.com/mlinxfeld/terraform-oci-fk-adb"
  source                                = "../../"
  adb_database_db_name                  = "FoggyKitchenADBSource"
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

module "oci-fk-adb-refreshable-clone" {
  #source                                = "github.com/mlinxfeld/terraform-oci-fk-adb"
  source                                = "../../"
  adb_database_db_name                  = "FoggyKitchenADBRefClone"
  adb_database_display_name             = "FoggyKitchenADB_RefreshableClone"
  adb_database_db_workload              = "OLTP" # Autonomous Transaction Processing (ATP)
  adb_free_tier                         = false
  adb_database_cpu_core_count           = 1
  adb_database_data_storage_size_in_tbs = 1
  compartment_ocid                      = var.compartment_ocid
  use_existing_vcn                      = false
  adb_private_endpoint                  = true
  adb_private_endpoint_label            = "fkadbpe2"
  source_type                           = "CLONE_TO_REFRESHABLE"
  source_id                             = module.oci-fk-adb-source.adb_database.adb_database_id
  refreshable_mode                      = var.refreshable_mode
}



