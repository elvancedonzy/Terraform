# Deploying Infrastructure with Terraform

**Terraform downloads providers e.g AWS, Azure or ….**

`terraform init`

**Used to see plan before running** 

`terraform plan`

**Used to create terraform file**

`terraform apply`

**Destroy infrastructure created by terraform**

`terraform destroy`

**Terraform destroy with Target** 

`terraform destroy -target <resource>.<resource_name>`

**Terraform state file** stores the metadata state if it is deleted the terraform information file state will also be gone it is recommended you back it up   

**Desired State & current State**

Gets the current state of infrastructure

`terraform refresh`

**Dependency Lock File**

terraform provider versions are saved in *terraform.lock.hcl* ``file
