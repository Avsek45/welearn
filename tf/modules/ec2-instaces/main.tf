resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  count         = var.instance_count

  tags = merge(
    var.instance_tags,
    {
      Name = format("Example Instance %02d", count.index + 1)
    }
  )
}
