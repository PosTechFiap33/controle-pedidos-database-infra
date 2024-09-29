resource "aws_security_group" "controle_pedidos_rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #TODO: alterar depois pra restringir acesso
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "controle_pedidos_rds_sg"
  }
}

resource "aws_db_instance" "controle_pedido_db" {
  identifier             = "controle-pedidos-db"
  engine                 = "postgres"
  engine_version         = "14.5"
  instance_class         = var.instanceType
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.controle_pedido_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.controle_pedidos_rds_sg.id]
  username               = var.dbUsername
  password               = var.dbPassWord
  dbName                 = var.dbName
  skip_final_snapshot    = true

  tags = {
    Name = "ControlePedidosDatabase"
  }
}

resource "aws_db_subnet_group" "controle_pedido_db_subnet_group" {
  name       = "controle-pedidos-database-sg"
  subnet_ids = var.subnets

  tags = {
    Name = "controle_pedido_db_subnet_group"
  }
}
