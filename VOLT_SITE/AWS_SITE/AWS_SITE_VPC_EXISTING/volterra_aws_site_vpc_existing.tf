resource "volterra_aws_vpc_site" "aws-vpc-example" {
  name      = "<Site_Name>"
  namespace = "system"
  aws_region = "<AWS_REGION>"
  
  assisted = false
  instance_type = "t3.xlarge"
  
  //AWS credentials entered in the Volterra Console
    aws_cred {
      name      = "<AWS_CREDENTIALS_NAME>"
      namespace = "system"
      tenant    = "<OPTIONAL>"
    }

  vpc {
    vpc_id = "<vpc-ID>"
  }

  ingress_egress_gw {
    aws_certified_hw = "aws-byol-multi-nic-voltmesh"
    no_forward_proxy = true
    no_global_network = true
    no_inside_static_routes = true
    no_outside_static_routes = true
    no_network_policy = true    

   
    //Availability zones and subnet options for the Volterra Node
    az_nodes {
      //AWS AZ
      aws_az_name = "<Availability zone to deploy the node - eu-north-1a for i.e>"
      
      //Site local outside subnet
      outside_subnet {
        existing_subnet_id = "<subnet-ID-outside>"
      }

      //Site local inside subnet
      inside_subnet {
        existing_subnet_id = "<subnet-ID-inside>"
      }

      //Workload subnet
      workload_subnet {    
        existing_subnet_id = "<subnet-ID-workload>"
      }
    }
  }
  
  //Mandatory
  logs_streaming_disabled = true
  
  //Mandatory
  no_worker_nodes = true
}