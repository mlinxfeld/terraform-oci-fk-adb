module "oci-fk-adb" {
  source                                = "github.com/mlinxfeld/terraform-oci-fk-adb"
  adb_database_db_name                  = "FoggyKitchenADB"
  adb_database_display_name             = "FoggyKitchenADB"
  adb_password                          = var.adb_password
  adb_database_db_workload              = "OLTP" # Autonomous Transaction Processing (ATP)
  adb_free_tier                         = false
  adb_database_cpu_core_count           = 1
  adb_database_data_storage_size_in_tbs = 1
  compartment_ocid                      = var.compartment_ocid
  use_existing_vcn                      = false
  adb_private_endpoint                  = true
  adb_backup_enabled                    = var.adb_backup_enabled
}

module "oci-fk-adb-from-backup" {
  source                                = "github.com/mlinxfeld/terraform-oci-fk-adb"
  adb_database_db_name                  = "FoggyKitchenADB2"
  adb_database_display_name             = "FoggyKitchenADB_FromBackup"
  adb_database_db_workload              = "OLTP" # Autonomous Transaction Processing (ATP)
  adb_free_tier                         = false
  adb_database_cpu_core_count           = 1
  adb_database_data_storage_size_in_tbs = 1
  compartment_ocid                      = var.compartment_ocid
  adb_private_endpoint                  = false
  source_type                           = "BACKUP_FROM_ID"
  autonomous_database_backup_id         = module.oci-fk-adb.adb_database_backup.adb_database_backup_id
}