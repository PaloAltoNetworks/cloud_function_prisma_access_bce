variable "source_object" {
  default = ""
}


variable "prisma_api_key" {
  description = "API Key for the Prisma Access"
  default   = ""

}

variable "email" {
  default = ""
  description = "The administrator emial ID of the Google Admin Site"
}

variable "cred_json" {
  description = "The cred_json for the Google Admin Site API call"
  default = <<-EOF
   ## the cred.json contents here....
  EOF
}

variable "access_policy_id" {
  description = "The Identity Aware Proxy Policy Id"
  default = ""
}

variable "access_level_id" {
  description = "The Access Level ID of Context Aware Proxy"
  default = ""
}
