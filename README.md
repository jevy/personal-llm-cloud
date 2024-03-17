# Docs

- [Paperspace Terraform](https://github.com/Paperspace/terraform-provider-paperspace/blob/master/pkg/provider/main.tf)

# Running it

1. Stand up the machine: `terraform apply -var-file="secrets.tfvars"`
2. Make a vault and add a tailscale key: 
2. `ansible-playbook main.yml --ask-vault-pass`
