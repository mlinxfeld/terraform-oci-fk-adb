variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "fingerprint" {}
variable "adb_password" {}
variable "adb_backup_enabled" {
  default = true
}
variable "adb_clone_from_backup" {
  default = false
}
