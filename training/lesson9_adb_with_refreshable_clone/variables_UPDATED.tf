variable "tenancy_ocid" {}
#variable "user_ocid" {}
#variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
#variable "fingerprint" {}
variable "adb_password" {}

variable "refreshable_mode" {
  default = "MANUAL" # Options: MANUAL vs AUTOMATIC
}