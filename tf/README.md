# Creating Multiple EC2 Instances with Terraform

### Created by Abhishek Maharjan
### Contact: amaharjan08@example.com

***

To create multiple EC2 instances with Terraform, follow these steps:

Create a new directory for your Terraform project.

```
mkdir terraform-ec2-instances
```

Initialize the directory as a Terraform project.
```
terraform init
```
Create a file named provider.tf and add the following code to configure the AWS provider.

```
provider "aws" {
  region = "us-west-2"
}
```
Note: Make sure to replace us-west-2 with the AWS region you want to use.

Create a file named variables.tf and add the following code to define the variables for your EC2 instances.

```
variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 3
}

variable "instance_tags" {
  description = "Tags to apply to EC2 instances."
  type        = map
  default     = {
    Name = "Example"
    Environment = "Dev"
  }
}
Note: You can customize the default values for the variables as needed.

Create a file named ec2.tf and add the following code to create the EC2 instances.

java
Copy code
module "ec2_instances" {
  source = "./modules/ec2_instances"

  instance_count = var.instance_count
  instance_tags  = var.instance_tags
}
Note: This code references a module named ec2_instances that will be created in step 6.

Create a directory named modules and a subdirectory named ec2_instances. In the ec2_instances directory, create a file named main.tf and add the following code to create the EC2 instances.

java
Copy code
resource "aws_instance" "ec2_instances" {
  count = var.instance_count

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = merge(
    var.instance_tags,
    {
      Name = "Example-${count.index}"
    }
  )
}
```
Note: This code creates t2.micro instances with the AMI ID ami-0c55b159cbfafe1f0. You can customize the instance type and AMI ID as needed.

Save all the files and run terraform apply to create the EC2 instances.

```
terraform apply
Terraform will prompt you to confirm the changes before applying them. Type yes to confirm.
```


Once the instances are created, you can view the details of the instances in the AWS console.