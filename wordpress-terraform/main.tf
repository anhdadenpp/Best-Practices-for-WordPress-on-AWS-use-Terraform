module "vpc" {
  source               = "./modules/VPC"
  cidr_blocks          = var.cidr_blocks
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_names  = var.public_subnet_names
  private_subnet_names = var.private_subnet_names
  availability_zones   = var.availability_zones
}

module "ec2" {
  source               = "./modules/EC2"
  bastion_sg_id        = module.sg.bastion_sg_id
  server_sg_id         = module.sg.server_sg_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids
  availability_zones   = var.availability_zones
}

module "sg" {
  source = "./modules/SecurityGroup"
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source             = "./modules/RDS"
  database_sg_id     = module.sg.database_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "asg" {
  source             = "./modules/ASG"
  server_sg_id       = module.sg.server_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn   = module.alb.target_group_arn
}

module "alb" {
  source            = "./modules/ALB"
  alb_sg_id         = module.sg.alb_sg_id
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "efs" {
  source             = "./modules/EFS"
  efs_sg_id          = module.sg.efs_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "ec" {
  source             = "./modules/Elasticcache"
  private_subnet_ids = module.vpc.private_subnet_ids
  ec_sg_id           = module.sg.ec_sg_id
}
