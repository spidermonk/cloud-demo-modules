# Overview

Modules contains the infrastructure terraform code that is used to create a complete
environment. It is intended to be used by the various environments defined 
in the infra project (dev, stage, prod, etc.), so TF code is not duplicated.

Each module has defined inputs in a vars.tf file and defined outputs in an output.tf file.

Purpose of this along with the corresponding infra repo is to demonstrate an 
enterprise ready architecture to host applications along with some Terraform
best practices.