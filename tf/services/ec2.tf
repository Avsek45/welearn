module "ec2" {
  source          = "../modules/ec2-instaces/"
  ami_id          = "ami-00c39f71452c08778"
  instance_type   = "t2.micro"
  keypair_name    = "welearn.pem"
  instance_count  = 3
  region          = "us-east-1"
  bucket_name     = "welearnkeys-nepal"
  public_key_path = "/home/cloud_user/.ssh/id_rsa.pub"
  instance_tags = {
    Name        = "Example Instance"
    Environment = "Development"
  }
}