
resource "aws_elasticache_subnet_group" "memcached_subnet_group" {
  name       = "memcached-subnet-group"
  subnet_ids = [var.private_subnet_ids[0], var.private_subnet_ids[1]]

  tags = {
    Name = "wp-memcached-subnet-group"
  }
}

resource "aws_elasticache_cluster" "memcached_cluster" {
  cluster_id           = "memcached-cluster"
  engine               = "memcached"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.6"

  subnet_group_name  = aws_elasticache_subnet_group.memcached_subnet_group.name
  security_group_ids = [var.ec_sg_id]

  tags = {
    Name = "wp-memcached-cluster"
  }
}
