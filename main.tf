resource "tmc_cluster" "create_tkgm_workload" {
  management_cluster_name = "tkgm-vsphere"
  provisioner_name        = "default"
  name                    = var.clustername

  meta {
    labels = { "key" : "test" }
  }

  spec {
    cluster_group = "default"
    tkg_vsphere {
      settings {
        network {
          pods {
            cidr_blocks = [
              "172.20.0.0/16",
            ]
          }
          services {
            cidr_blocks = [
              "10.96.0.0/16",
            ]
          }
          control_plane_end_point = ""
        }
        security {
          ssh_key = "default"
        }
      }

      distribution {
        version = var.tkcversion
        workspace {
          datacenter        = var.datacenter
          datastore         = var.datastore
          workspace_network = var.workspace_network
          folder            = var.folder
          resource_pool     = var.resource_pool
        }
      }


      topology {
        control_plane {
          vm_config {
            cpu = "2"
            disk_size = "20"
            memory = "4096"
          }
          high_availability = false
        }
        node_pools {
          spec {
            worker_node_count = "1"
            cloud_label = {
              "key1" : "val1"
            }
            node_label = {
              "key2" : "val2"
            }

            tkg_vsphere {
              vm_config {
                cpu       = "2"
                disk_size = "40"
                memory    = "4096"
              }
            }
          }

          info {
            name        = "default-nodepool"
            description = "default nodepool"
          }
        }
      }
    }
  }
}
