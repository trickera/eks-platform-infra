## O que muda

<!-- resumo curto do que esse PR mexe na infra -->

## Checklist

- [ ] `terraform plan` revisado (output no comentário do PR)
- [ ] Conferido se nada importante vai ser destruído/recriado (procurar `replace` e `destroy` no plan)
- [ ] Nenhum segredo ou ARN sensível no diff
- [ ] tflint e trivy passando
