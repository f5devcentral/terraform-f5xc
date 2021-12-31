//==========================================================================
//Definition of the Origin, 1-origin.tf
//Start of the TF file
resource "volterra_origin_pool" "op-ip-internal" {
  name                   = "op-ip-internal"
  //Name of the namespace where the origin pool must be deployed
  namespace              = "VOLTERRA_NS"
 
   origin_servers {

    public_name {
      dns_name = "APP_FQDN"
    }

    labels = {
    }
  }

  no_tls = true
  port = "80"
  endpoint_selection     = "LOCALPREFERED"
  loadbalancer_algorithm = "LB_OVERRIDE"
}
//End of the file
//==========================================================================

//==========================================================================
//Definition of the Load-Balancer, 2-https-lb.tf
//Start of the TF file
resource "volterra_http_loadbalancer" "lb-https-tf" {
depends_on = [volterra_origin_pool.op-ip-internal]
//Mandatory "Metadata"
name      = "lb-https-tf"
//Name of the namespace where the origin pool must be deployed
namespace = "VOLTERRA_NS"
//End of mandatory "Metadata" 
//Mandatory "Basic configuration" with Auto-Cert 
  domains = ["mypublic.appfqdn.com"]
  https_auto_cert {
    add_hsts = true
    http_redirect = true
    no_mtls = true
    enable_path_normalize = true
    tls_config {
        default_security = true
      }
  }
default_route_pools {
    pool {
      name = "op-ip-internal"
      namespace = "VOLTERRA_NS"
    }
    weight = 1
  }
//Mandatory "VIP configuration"
advertise_on_public_default_vip = true
//End of mandatory "VIP configuration"
//Mandatory "Security configuration"
no_service_policies = true
no_challenge = true
disable_rate_limit = true
//WAAP Policy reference, already created in Volterra UI
app_firewall {
  name = "WAAP_EXISTING_POLICY_NAME"
  namespace = "VOLTERRA_NS"
}
multi_lb_app = true
user_id_client_ip = true
//End of mandatory "Security configuration"
//Mandatory "Load Balancing Control"
source_ip_stickiness = true
//End of mandatory "Load Balancing Control"
  
}

//End of the file
//==========================================================================