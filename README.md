# Repositorio para realizar o deploy da infra em K8S na aws

Este repositório contém a infraestrutura necessária para criar um banco RD na AWS utilizando Terraform. O processo de CI/CD é gerenciado pelo GitHub Actions, que automatiza a criação e a configuração da infraestrutura.

## Autores

- [Adriano Morgon Arruda](https://github.com/adrianomorgon)
- [Flávio Roberto Teixeira](https://github.com/FlavioRoberto)

## Estrutura do Repositório

```
.
├── .github/
│   └── workflows/
│       ├── feature.yml                 # Configuração de validação dos arquivos TF via GitHub Actions
│       └── terraform.yml               # Valida, cria e executa o plano do Terraform na AWS
├── terraform/
│   ├── main.tf                         # Configuração principal do Terraform
│   ├── vars.tf                         # Definições de variáveis
│   ├── provider.tf                     # Configuração do provider do Terraform
│   ├── data.tf                         # Recupera informações de recursos da AWS (VPC e subnets)
└── README.md                           # Documentação do repositório
```


## Pré-requisitos

- Conta na AWS com permissões para criar RDS e outros recursos necessários.
- Acesso ao Terraform Cloud ou Terraform.io para parametrização das variáveis.

## Configuração do Terraform

1. **Variáveis**: Edite o arquivo `variables.tf` para configurar as variáveis necessárias (como região, nome do rds, etc.). Se o valor da variável for senssível a mesma deverá ser cadastrada no terraform.io.
2. **Estado Remoto**: Assegure que o Terraform esteja conectado ao Terraform.io para gerenciar o estado da infraestrutura.

## CI/CD com GitHub Actions

O fluxo de trabalho está definido em `.github/workflows`. Ele realiza as seguintes etapas:

1. **Feature**: Aciona a pipeline sempre que um push é feito na branch `feature` para validar os arquivos *.tf.
2. terraform.yaml: Aciona a pipeline sempre que um Pull Request é feito na branch `main` para criar os recursos de infra na AWS.

## Executando o Projeto

1. **Clone o repositório**:
   git clone https://github.com/PosTechFiap33/controle-pedidos-infra-k8S.git
   cd controle-pedidos-infra-k8S

2. **Configurar credenciais**:
   - Configure suas credenciais da AWS e do Terraform Cloud e GitHub Secrets.

3. **Crie uma branch com préfixo feature**:
   - Realize as alterações necessárias na configuração do Terraform e nos charts do Helm.

4. **Faça o push**:
   - Aguarde a execução da pipe para validar os arquivos.

6. **Faça o merge na branch `main`**:
   - Realize o merge para que a pipe inicie o deploy na AWS.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

