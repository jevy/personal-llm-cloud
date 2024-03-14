# Docs

- [Paperspace Terraform](https://github.com/Paperspace/terraform-provider-paperspace/blob/master/pkg/provider/main.tf)

# Running it

1. Stand up the machine: `terraform apply -var-file="secrets.tfvars"`
2. Setup the machine: `ansible-playbook ansible/setup_infra.yml`
