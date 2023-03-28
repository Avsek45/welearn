variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instance."
}

variable "instance_type" {
  description = "The instance type to use for the instance."
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to the instance."
}

variable "instance_count" {
  description = "The number of instances to launch."
}

variable "instance_tags" {
  description = "The tags to apply to each instance."
  type = map(string)
  default = {
    Name = "Learning Instance"
    Environment = "Development"
  }
}
