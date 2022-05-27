**Terraform variables**

Variable file is called variables.tf

**Explicate way of defining instance type**

`terraform plan -var="instancetype=t2.small"`

**Apply terraform using file method**

`terraform plan -var-file=”custom.tfvars”`

**Using the environment variable method**

`setx TF_VAR_instancetype m5.large`

always remember to open a new terminal to apply setting 

To check environment variable use 

`echo %TF_VAR_instancetype%`

**If no instance type is specified in the [variable.tf](http://variable.tf) and in [main.tf](http://main.tf) file value will be required before terraform plan occurs**

**terraform.tfvars is used in congestion with [variables.tf](http://variables.tf)**
