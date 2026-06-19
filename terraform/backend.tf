# O bucket e a tabela precisam existir antes do primeiro init; sobem pelo stack
# em ../bootstrap. O backend não pode guardar o state da infra que cria o
# próprio backend, então isso fica fora do ciclo aqui.
terraform {
  backend "s3" {
    bucket         = "platform-terraform-state"
    key            = "eks/staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "platform-terraform-locks"
    encrypt        = true
  }
}
