variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instance."
}

variable "instance_type" {
  description = "The instance type to use for the instance."
}

variable "instance_count" {
  description = "The number of instances to launch."
}

variable "region" {
  description = "default region"
}
variable "keypair_name" {
  type        = string
  description = "Name of the key pair to be created"
}

variable "public_key_path" {
  type        = string
  description = "Path to the public key file for the key pair"
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket to store the key pair"
}


variable "instance_tags" {
  description = "The tags to apply to each instance."
  type = map(string)
  default = {
    Name = "Learning Instance"
    Environment = "Development"
  }
}
