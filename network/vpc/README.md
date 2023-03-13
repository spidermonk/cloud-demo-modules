# Overview

Creates a standard VPC with the provided CIDR range with:
* AWS DNS support for hostname resolution
* Hosts getting public AWS DNS hostnames if they have a public IP
  * Note: hosts always get a private IP & private host name <resource name>.ec2.internal
* Default DHCP option set as provided by AWS
* Standard s3 setup for VPC flow logs

## TODO
* Use IPAM to manage IPs for the CIDR - this is a common enterprise pattern/technique