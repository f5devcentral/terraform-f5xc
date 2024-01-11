# Terraform plan examples for Volterra

## Overview
In this repository, you will find Terraform plan examples for Volterra deployments.

## Getting Started
The Volterra modules are available here : https://registry.terraform.io/providers/volterraedge/volterra/latest

![alt text][logo]

[logo]: https://raw.githubusercontent.com/f5devcentral/terraform-volterra/main/terraform_screen.png "Terraform"

## Quick Demo

[![Alt text](https://img.youtube.com/vi/M2TGAFAbsSc/0.jpg)](https://www.youtube.com/watch?v=M2TGAFAbsSc)

## Pre-Requirements
Have a Volterra API Certificate. Please see this page for the API Certificate generation: https://volterra.io/docs/how-to/user-mgmt/credentials

Extract the certificate and the key from the .p12:

```
    openssl pkcs12 -info -in certificate.p12 -out private_key.key -nodes -nocerts -legacy
    openssl pkcs12 -info -in certificate.p12 -out certificate.cert -nokeys -legacy
```


## Support
For support, please open a GitHub issue.  Note, the code in this repository is community supported and is not supported by F5 Networks.  For a complete list of supported projects please reference [SUPPORT.md](SUPPORT.md).

## Community Code of Conduct
Please refer to the [F5 DevCentral Community Code of Conduct](code_of_conduct.md).


## License
[Apache License 2.0](LICENSE)

## Copyright
Copyright 2014-2020 F5 Networks Inc.


### F5 Networks Contributor License Agreement

Before you start contributing to any project sponsored by F5 Networks, Inc. (F5) on GitHub, you will need to sign a Contributor License Agreement (CLA).

If you are signing as an individual, we recommend that you talk to your employer (if applicable) before signing the CLA since some employment agreements may have restrictions on your contributions to other projects.
Otherwise by submitting a CLA you represent that you are legally entitled to grant the licenses recited therein.

If your employer has rights to intellectual property that you create, such as your contributions, you represent that you have received permission to make contributions on behalf of that employer, that your employer has waived such rights for your contributions, or that your employer has executed a separate CLA with F5.

If you are signing on behalf of a company, you represent that you are legally entitled to grant the license recited therein.
You represent further that each employee of the entity that submits contributions is authorized to submit such contributions on behalf of the entity pursuant to the CLA.
