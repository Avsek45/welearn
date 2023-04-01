# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create a security group
resource "aws_security_group" "ec2-sg" {
  name_prefix = "ec2-sg"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a key pair and save it to S3
resource "aws_key_pair" "ec2-keypair" {
  key_name   = var.keypair_name
  public_key = file(var.public_key_path)
}
resource "aws_s3_bucket" "key_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name = "key-pair-bucket"
  }
}
resource "aws_s3_bucket_object" "key_object" {
  bucket = aws_s3_bucket.key_bucket.id
  key    = var.keypair_name
  source = var.public_key_path
}

# Create an EC2 instance
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2-keypair.key_name
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  count         = var.instance_count
  tags = merge(
    var.instance_tags,
    {
      Name = format("Example Instance %02d", count.index + 1)
    }
  )
}

