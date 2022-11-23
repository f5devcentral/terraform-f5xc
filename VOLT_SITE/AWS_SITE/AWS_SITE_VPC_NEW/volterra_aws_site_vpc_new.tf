resource "volterra_aws_vpc_site" "volterra_aws_new" {
  name       = "my-aws-site"
  namespace  = "system"
  aws_region = "us-west-2"

  // One of the arguments from this list "default_blocked_services blocked_services" must be set
  default_blocked_services = true

  // One of the arguments from this list "aws_cred" must be set

  aws_cred {
    name      = "my-aws-cred"
    namespace = "system"
  }
  // One of the arguments from this list "direct_connect_disabled direct_connect_enabled" must be set
  direct_connect_disabled = true
  instance_type           = "t3.xlarge"



  // One of the arguments from this list "ingress_gw ingress_egress_gw voltstack_cluster" must be set

  vpc {
    new_vpc {
      primary_ipv4 = "10.10.0.0/16"
    }
  }

  ingress_gw {
    allowed_vip_port {
      // One of the arguments from this list "use_http_port use_https_port use_http_https_port custom_ports" must be set
      use_http_port = true
    }

    aws_certified_hw = "aws-byol-voltmesh"

    az_nodes {
      aws_az_name = "us-west-2a"
      disk_size   = "80"

      local_subnet {
        // One of the arguments from this list "subnet_param existing_subnet_id" must be set

        subnet_param {
          ipv4 = "10.10.1.0/24"
        }
      }
    }
  }
}