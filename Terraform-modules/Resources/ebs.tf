module "ebs" {
  source = "../Modules/ebs"
}

resource "aws_volume_attachment" "attach" {
  device_name = "/dev/sdb"
  volume_id   = module.ebs.ebs_output
  instance_id = module.ec2.ec2_output
}