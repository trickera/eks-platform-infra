locals {
  # Divide o /16 em /20: três primeiros blocos pra subnets privadas,
  # bloco 8 em diante pras públicas. Sobra espaço pra crescer no meio.
  private_subnets = [for i, az in var.azs : cidrsubnet(var.cidr, 4, i)]
  public_subnets  = [for i, az in var.azs : cidrsubnet(var.cidr, 4, i + 8)]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = var.name
  cidr = var.cidr
  azs  = var.azs

  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_nat_gateway   = true
  enable_dns_hostnames = true

  # Um NAT atende as duas AZs. NAT por AZ dobra o custo fixo e em staging
  # a HA de saída não compensa. Em produção isso vira um por AZ.
  single_nat_gateway = true

  # Tags que o EKS/ALB usam pra descobrir onde colocar load balancer.
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}
