## Get your own LLMs juice

Do you want to play with all the fancy LLM models but:
- don't want to buy your own GPU?
- your CPU is too low?
- you can live with Big Corp having data on an instance in their cloud but recognize they don't care you on an individual level?

Then you're in the right place.

## Overall approach

I wanted to make the approach as standard and simple as possible to understand. Therefore I reduced the amount of customs scripts as much as possible.

- *Terraform* - It uses Paperspace's Terraform scripts to deploy the machine with the instance size of your choosing. To swap out for a different provider is pretty straight forward if you want. 
- *Ansible* - Ansible actually will call and deploy the Terraform setup, making the deployment of this script very convenient. The main focus of Ansible is to do the massaging and installation of packages after Terraform created the machine.
- *Tailscale* - Since opening the port on the machine to the public is generally a bad idea (especially one with a juicy GPU), we use Tailscale as a VPN and add our newly created

## Why Paperspace?

- At the time of writing this, it was the least expensive I could find that has Terraform modules.
- Paperspace has a native "shutdown timeout in hours" option which is perfect if you only want to use a machine for a few hours and don't need it running 24/7.

# Getting Started

## Preparation

Stuff to collect in advance:

- *Paperspace API (2 minutes)* - You will need a Paperspace API key.
- *Paperspace Credits (5 minutes)* - You likely will have to add some credits in advance of running this script so buy maybe $10 worth or something.
- *Tailscale Setup (10 minutes)* - Get Tailscale setup on your local machine
- *Tailscale API (2 minutes)* - In the Tailscale web UI settings, go to "Personal Settings -> Keys". Then generate an "Auth key" that is "Reusable" and "Ephemeral".

## Setup Terraform and Ansible

1. Install the tailscale role: `ansible-galaxy install -r requirements.yml`
2. Create a secrets.tfvars with your paperspace api key, user_email and team_id
3. Create an ansible vault with the tailscale key: `ansible-vault create blah.yml`
4. In the `ansible` directory, run: `ansible-playbook playbooks/setup_server.yml --ask-vault-pass`

To connect to your instance:
1. Find the IP address either from the Tailscale UI or `tailscale status`
2. In your browser, visit `http://<tailscale_ip_above>:7860`

## Destroying it

1. `cd terraform`
2. `terraform destroy --var-file=secrets.tfvars`

Note: Paperspace will keep an IP address reservation and will charge you for it. When you're done with it, login to Paperspace and delete it.

# TODO

- [ ] Fix the ansible destroy script
- [ ] Alternative providers

# Docs

- [Paperspace Terraform](https://github.com/Paperspace/terraform-provider-paperspace/blob/master/pkg/provider/main.tf)
