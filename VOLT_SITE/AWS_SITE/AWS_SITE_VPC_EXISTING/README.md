## Create an AWS Site for existing VPC

More content and documentation here : https://devcentral.f5.com/s/articles/Create-a-VPC-VoltMesh-AWS-site-two-interfaces-node?page=1
And here : https://www.volterra.io/docs/how-to/site-management/create-aws-site?query=core%20ru

NB : Internal Subnet is used for multi-nodes (cluster) deployment, so that Volterra Nodes can communicate each other.

Sometime, after the site is created in your Volterra tenant, the site can stay in "Generated" state, but not "Applying" state. It means, the last call to Apply the config did not pass (for sevreral reasons in the volterra control plane).
You can use the API call below to APPLY the site creation

```
POST /api/terraform/namespaces/system/terraform/aws_vpc_site/NAME_OF_THE_SITE/run HTTP/1.1
Host: TENANT.console.ves.volterra.io
Authorization: APIToken <your API token>
Content-Type: application/json
Content-Length: 23

{
  "action": "APPLY"
}

```