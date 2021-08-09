
provider "google" {
  region                  = var.region
  project                 = var.project
}


resource "random_id" "token" {
  byte_length = 16
}

resource "google_cloudfunctions_function" "function" {
  name        = "update_prisma_access_ip_list"  ### please update this name you want ###
  description = "cloud function to update access leve ip list"  ### please update this with your description ###  
  runtime     = "python39"

  available_memory_mb   = 128
  source_archive_bucket = var.source_bucket
  source_archive_object = var.source_object
  trigger_http          = true
  entry_point           = "hello_world"
  environment_variables = {
    PA_API_KEY = var.prisma_api_key
    EMAIL = var.email
    TOKEN = random_id.token.b64_url
    CRED_JSON = var.cred_json
    ACCESS_POLICY_ID = var.access_policy_id
    ACCESS_LEVEL_ID = var.access_level_id
  }
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

output "Trigger_URL" {
  value = format("%s?token=%s",google_cloudfunctions_function.function.https_trigger_url, random_id.token.b64_url)
}
