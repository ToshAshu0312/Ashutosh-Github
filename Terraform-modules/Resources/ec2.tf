module "ec2" {
  source = "../Modules/ec2"
}

output "ec2_output" {
  value = module.ec2.ec2_output
}

output "ec2_tags" {
  value = module.ec2.localtags
}