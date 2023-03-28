module "ec2_instances" {
  source         = "../modules/ec2-instaces/"
  ami_id         = "ami-0123456789abcdef0"
  instance_type  = "t2.micro"
  key_name       = "ouraws-keypair"
  instance_count = 3

  instance_tags = {
    Name        = "Example Instance"
    Environment = "Development"
  }
}
