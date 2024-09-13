resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.wp-db.id
  instance_class     = "db.r5.large"
  engine             = aws_rds_cluster.wp-db.engine
  engine_version     = aws_rds_cluster.wp-db.engine_version
}

resource "aws_rds_cluster" "wp-db" {
  cluster_identifier     = "aurora-cluster-demo"
  availability_zones     = ["ap-southeast-2a", "ap-southeast-2b"]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  engine                 = "aurora-mysql"
  engine_version         = "8.0.mysql_aurora.3.05.2"
  database_name          = "wp_db"
  master_username        = "admin"
  master_password        = "matkhau1"
  skip_final_snapshot    = true
  apply_immediately      = true
  vpc_security_group_ids = [var.database_sg_id]
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = var.private_subnet_ids # List of subnet IDs in your VPC

  tags = {
    Name = "my-rds-subnet-group"
  }
}

