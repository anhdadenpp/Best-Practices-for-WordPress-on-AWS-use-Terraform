resource "aws_instance" "my-bastion" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  key_name                    = "dtkiet-lab-key"
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_ids[0]
  availability_zone           = "ap-southeast-1a"


  tags = {
    Name = "wp-bastion"
  }
}

resource "aws_instance" "my_wp_instance" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  key_name                    = "dtkiet-lab-key"
  vpc_security_group_ids      = [var.server_sg_id]
  associate_public_ip_address = false
  subnet_id                   = var.private_subnet_ids[0]
  availability_zone           = "ap-southeast-1a"


  tags = {
    Name = "wp-server"
  }
}
