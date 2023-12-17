module "subnet" {
  source = “git::https://github.com/bhawna01bhatt/subnet_module.git?ref=subnet-module”
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  pub_subnet_cidr = var.pub_subnet_cidr
  pri_subnet_cidr = var.pri_subnet_cidr
  subnet_az       = var.subnet_az
  pub_subnet_name = var.pub_subnet_name
  pri_subnet_name = var.pri_subnet_name
}
