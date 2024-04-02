
# FoggyKitchen OCI Autonomous Database with Terraform 

## LESSON 1 - Creating Free Tier Autonomous DB Shared

In this lesson, we'll set up a Free Tier Autonomous Database.

![](lesson2_free_tier_adb_with_ip_whitelisting.png)

## Deploy Using Oracle Resource Manager

1. Click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/mlinxfeld/terraform-oci-fk-adb/releases/latest/download/terraform-oci-fk-adb-lesson1.zip)

    If you aren't already signed in, when prompted, enter the tenancy and user credentials.

2. Review and accept the terms and conditions.

3. Select the region where you want to deploy the stack.

4. Follow the on-screen prompts and instructions to create the stack.

5. After creating the stack, click **Terraform Actions**, and select **Plan**.

6. Wait for the job to be completed, and review the plan.

    To make any changes, return to the Stack Details page, click **Edit Stack**, and make the required changes. Then, run the **Plan** action again.

7. If no further changes are necessary, return to the Stack Details page, click **Terraform Actions**, and select **Apply**. 

## Deploy Using the Terraform CLI in Cloud Shell

### Clone of the repo into OCI Cloud Shell

Now, you'll want a local copy of this repo. You can make that with the commands:
Clone the repo from github by executing the command as follows and then go to proper subdirectory:

```
martin_lin@codeeditor:~ (eu-frankfurt-1)$ git clone https://github.com/mlinxfeld/terraform-oci-fk-adb.git

martin_lin@codeeditor:~ (eu-frankfurt-1)$ cd terraform-oci-fk-adb

martin_lin@codeeditor:terraform-oci-fk-adb (eu-frankfurt-1)$ cd training/lesson1_free_tier_adb/
```

### Prerequisites
Create environment file with terraform.tfvars file starting with example file:

```
martin_lin@codeeditor:lesson1_free_tier_adb (eu-frankfurt-1)$ cp terraform.tfvars.example terraform.tfvars

martin_lin@codeeditor:lesson1_free_tier_adb (eu-frankfurt-1)$ vi terraform.tfvars

tenancy_ocid       = "ocid1.tenancy.oc1..<your_tenancy_ocid>"
compartment_ocid   = "ocid1.compartment.oc1..<your_comparment_ocid>"
region             = "<oci_region>"
adb_password       = "<adb_password>"
```

### Initialize Terraform

Run the following command to initialize Terraform environment:

```
martin_lin@codeeditor:lesson1_free_tier_adb (eu-frankfurt-1)$ terraform init

Initializing the backend...
Initializing modules...
Downloading git::https://github.com/mlinxfeld/terraform-oci-fk-adb.git for fk-adb...
- fk-adb in .terraform/modules/fk-adb

Initializing provider plugins...
- Reusing previous version of oracle/oci from the dependency lock file
- Reusing previous version of hashicorp/tls from the dependency lock file
- Installing oracle/oci v5.29.0...
- Installed oracle/oci v5.29.0 (signed by a HashiCorp partner, key ID 1533A49284137CEB)
- Installing hashicorp/tls v4.0.5...
- Installed hashicorp/tls v4.0.5 (signed by HashiCorp)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Apply the changes 

Run the following command for applying changes with the proposed plan:

```
martin_lin@codeeditor:lesson3_adb_with_private_endpoint (eu-frankfurt-1)$ terraform apply
erraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.oci-fk-adb.oci_database_autonomous_database.fk_adb_database will be created
  + resource "oci_database_autonomous_database" "fk_adb_database" {
     + actual_used_data_storage_size_in_tbs           = (known after apply)
      + admin_password                                 = (sensitive value)
      + allocated_storage_size_in_tbs                  = (known after apply)
      + apex_details                                   = (known after apply)
      + are_primary_whitelisted_ips_used               = (known after apply)
      + auto_refresh_frequency_in_seconds              = (known after apply)
      + auto_refresh_point_lag_in_seconds              = (known after apply)
      + autonomous_container_database_id               = (known after apply)
      + autonomous_database_backup_id                  = (known after apply)
      + autonomous_database_id                         = (known after apply)
      + autonomous_maintenance_schedule_type           = (known after apply)
      + available_upgrade_versions                     = (known after apply)
      + backup_config                                  = (known after apply)
      + backup_retention_period_in_days                = (known after apply)
      + character_set                                  = (known after apply)
      + clone_type                                     = (known after apply)
      + compartment_id                                 = "ocid1.compartment.oc1..aaaaaaaaiyy4srmrb32v5rlniicwmpxsytywiucgbcp5ext6e4ahjfuloewa"
      + compute_count                                  = (known after apply)
      + compute_model                                  = (known after apply)
      + connection_strings                             = (known after apply)
      + connection_urls                                = (known after apply)
      + cpu_core_count                                 = 1
      + data_safe_status                               = "NOT_REGISTERED"
      + data_storage_size_in_gb                        = (known after apply)
      + data_storage_size_in_tbs                       = 1
      + database_edition                               = (known after apply)
      + database_management_status                     = (known after apply)
      + dataguard_region_type                          = (known after apply)
      + db_name                                        = "FoggyKitchenFreeTierADB"
      + db_version                                     = "19c"
      + db_workload                                    = "OLTP"
      + defined_tags                                   = (known after apply)
      + disaster_recovery_region_type                  = (known after apply)
      + display_name                                   = "FoggyKitchenFreeTierADB"
      + failed_data_recovery_in_seconds                = (known after apply)
      + freeform_tags                                  = {
          + "Owner" = "FoggyKitchen"
        }
      + id                                             = (known after apply)
      + in_memory_area_in_gbs                          = (known after apply)
      + in_memory_percentage                           = (known after apply)
      + infrastructure_type                            = (known after apply)
      + is_access_control_enabled                      = (known after apply)
      + is_auto_scaling_enabled                        = false
      + is_auto_scaling_for_storage_enabled            = (known after apply)
      + is_data_guard_enabled                          = false
      + is_dedicated                                   = (known after apply)
      + is_dev_tier                                    = (known after apply)
      + is_free_tier                                   = true
      + is_local_data_guard_enabled                    = false
      + is_mtls_connection_required                    = (known after apply)
      + is_preview                                     = (known after apply)
      + is_preview_version_with_service_terms_accepted = (known after apply)
      + is_reconnect_clone_enabled                     = (known after apply)
      + is_refreshable_clone                           = (known after apply)
      + is_remote_data_guard_enabled                   = (known after apply)
      + is_replicate_automatic_backups                 = (known after apply)
      + key_history_entry                              = (known after apply)
      + key_store_id                                   = (known after apply)
      + key_store_wallet_name                          = (known after apply)
      + kms_key_id                                     = (known after apply)
      + kms_key_lifecycle_details                      = (known after apply)
      + kms_key_version_id                             = (known after apply)
      + license_model                                  = "LICENSE_INCLUDED"
      + lifecycle_details                              = (known after apply)
      + local_adg_auto_failover_max_data_loss_limit    = (known after apply)
      + local_disaster_recovery_type                   = (known after apply)
      + local_standby_db                               = (known after apply)
      + max_cpu_core_count                             = (known after apply)
      + memory_per_oracle_compute_unit_in_gbs          = (known after apply)
      + ncharacter_set                                 = (known after apply)
      + net_services_architecture                      = (known after apply)
      + next_long_term_backup_time_stamp               = (known after apply)
      + nsg_ids                                        = (known after apply)
      + ocpu_count                                     = (known after apply)
      + open_mode                                      = (known after apply)
      + operations_insights_status                     = (known after apply)
      + peer_db_ids                                    = (known after apply)
      + permission_level                               = (known after apply)
      + private_endpoint                               = (known after apply)
      + private_endpoint_ip                            = (known after apply)
      + private_endpoint_label                         = (known after apply)
      + provisionable_cpus                             = (known after apply)
      + refreshable_mode                               = (known after apply)
      + refreshable_status                             = (known after apply)
      + remote_disaster_recovery_configuration         = (known after apply)
      + remote_disaster_recovery_type                  = (known after apply)
      + resource_pool_leader_id                        = (known after apply)
      + role                                           = (known after apply)
      + secret_id                                      = (known after apply)
      + secret_version_number                          = (known after apply)
      + service_console_url                            = (known after apply)
      + shrink_adb_trigger                             = (known after apply)
      + source                                         = (known after apply)
      + source_id                                      = (known after apply)
      + standby_db                                     = (known after apply)
      + standby_whitelisted_ips                        = (known after apply)
      + state                                          = (known after apply)
      + subnet_id                                      = (known after apply)
      + supported_regions_to_clone_to                  = (known after apply)
      + system_tags                                    = (known after apply)
      + time_created                                   = (known after apply)
      + time_data_guard_role_changed                   = (known after apply)
      + time_deletion_of_free_autonomous_database      = (known after apply)
      + time_disaster_recovery_role_changed            = (known after apply)
      + time_local_data_guard_enabled                  = (known after apply)
      + time_maintenance_begin                         = (known after apply)
      + time_maintenance_end                           = (known after apply)
      + time_of_auto_refresh_start                     = (known after apply)
      + time_of_joining_resource_pool                  = (known after apply)
      + time_of_last_failover                          = (known after apply)
      + time_of_last_refresh                           = (known after apply)
      + time_of_last_refresh_point                     = (known after apply)
      + time_of_last_switchover                        = (known after apply)
      + time_of_next_refresh                           = (known after apply)
      + time_reclamation_of_free_autonomous_database   = (known after apply)
      + time_until_reconnect_clone_enabled             = (known after apply)
      + timestamp                                      = (known after apply)
      + total_backup_storage_size_in_gbs               = (known after apply)
      + use_latest_available_backup_time_stamp         = (known after apply)
      + used_data_storage_size_in_gbs                  = (known after apply)
      + used_data_storage_size_in_tbs                  = (known after apply)
      + vault_id                                       = (known after apply)
      + whitelisted_ips                                = [
          + "160.34.126.38",
        ]
    }
(...)

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.oci-fk-adb.random_password.wallet_password: Creating...

(...)

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

```

### Destroy the changes 

Run the following command for destroying all resources:

```
martin_lin@codeeditor:lesson1_free_tier_adb (eu-frankfurt-1)$ terraform destroy 
module.oci-fk-adb.random_password.wallet_password: Refreshing state... [id=none]
(...)

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.oci-fk-adb.oci_database_autonomous_database.fk_adb_database will be destroyed

(...)

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

(...)

Destroy complete! Resources: 3 destroyed.
```
