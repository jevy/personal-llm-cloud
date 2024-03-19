data "paperspace_template" "ubuntu" {
  id = "tmun4o2g"
}

data "paperspace_user" "jevin" {
  email = "jevin@quickjack.ca"
  team_id = "te5ovehgh"
}

resource "paperspace_machine" "gpu-for-inference" {
  region = "East Coast (NY2)" // optional, defaults to provider region if not specified
  name = "Personal Inference"
  machine_type = "P5000"
  size = 50
  billing_type = "hourly"
  assign_public_ip = true
  template_id = data.paperspace_template.ubuntu.id
  user_id = data.paperspace_user.jevin.id
  team_id = data.paperspace_user.jevin.team_id
  #script_id = paperspace_script.my-script-1.id
  shutdown_timeout_in_hours = 2
  # live_forever = true
}
