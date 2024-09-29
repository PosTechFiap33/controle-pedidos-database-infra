variable "region" {
  default = "us-east-1"
}

variable "instanceType" {
  default = "db.t3.micro"
}

variable "dbUsername" {
  description = "Nome de usuário do banco de dados"
  type        = string
}

variable "dbPassWord" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}

variable "dbName" {
  description = "Nome do banco de dados"
  type        = string
}
