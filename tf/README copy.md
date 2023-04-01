# Creating Multiple EC2 Instances with Terraform

### Created by Abhishek Maharjan
### Contact: amaharjan08@example.com

***

## Pre requesite

Before we begin, please make sure you have the following:

- An AWS account
- AWS CLI installed on your computer
- Terraform installed on your computer
- An SSH key pair (you can create one with the ssh-keygen command)
- With that out of the way, let's get started:

1. ### Create an IAM user with programmatic access
   - In order to use Terraform with your AWS account, you'll need to create an IAM user with programmatic access. Here's how to do it:
    - Log in to the AWS Management Console and navigate to the IAM service.
    - Click on "Users" and then "Add user".
    - Give your user a name and select "Programmatic access" as the access type.
    - Attach an existing policy or create a custom one that grants your user permissions to create and manage EC2 instances.
    - Review your settings and create the user.
    - Once you've created the user, make sure to save the access key and secret key that are generated. You'll need these later.

2. Configure AWS CLI
  - In order to use Terraform with your AWS account, you'll need to configure the AWS CLI with the access key and secret key you just created. Here's how to do it:
    - Open a terminal and run the following command: aws configure.
    - Enter the access key and secret key when prompted.
    Set the default region to the region where you want to create your EC2 - instance.
    - Leave the output format as the default (JSON).
    - Create a Terraform configuration file

Now it's time to create a Terraform configuration file that will define the resources you want to create. Here's an example:To create multiple EC2 instances with Terraform, follow these steps:

---
Create a new directory for your Terraform project

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