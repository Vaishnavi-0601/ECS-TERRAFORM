
resource "aws_db_instance" "db" {
  allocated_storage    = 20
  db_name              = "test"
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.t3.micro"
  username             = "admin123"
  password             = "admin123"
  skip_final_snapshot  = true
  port     = 5432
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  backup_retention_period = 7
  
}


variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0ca9cc2702415eb8b", "subnet-0b214930f68d0679b", "subnet-0e9890e2f57b1daa1", "subnet-0ae625146f645a602", "subnet-0b788c2cc3c7291bd", "subnet-03a483990fda22b78"]
}
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-grp"
  subnet_ids = var.subnet_ids
}