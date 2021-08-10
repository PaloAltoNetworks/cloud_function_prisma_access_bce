# The Cloud Function to auto sync the Prisma Access Node IP List with BeyondCorp Access Level
 -- This is developed by Palo Alto Networks GCP Techinical Engagement Team
1. Clone this repo to your local machine or Google Cloud Shell.
2. Use gcloud config list to ensure you have login with your Google Account
3. Type "gcloud auth application-default login" to let your local application to temporarily use your own user credentials for API access. Or you can use "gcloud auth application-default login --client-id-file=clientid.json" to login by passing in a file containing your own client id
4. Update the variables in the var.tf

   4.1 Go to Google Cloud Console -> Security -> Access Context Manager, for example, see below:
       ![image](https://user-images.githubusercontent.com/52453932/128668202-5e459a51-7921-4730-9327-72a7f137d8ca.png)
       access_policy_id is: 515250846142
       
      access_level_id: prisma_access_address
   
   4.2 Go to Google Cloud Console -> IAM & Admin -> Service Accounts -> Create a new Service Account (no permisson or role needed). Create an Access Key of the Service Account, and download the JSON file. Open the JSON file and copy the content into the var.tf variable "cred_json", like below:
variable "cred_json" {
  description = "The cred_json for the Google Admin Site API call"
  default = <<-EOF
  {
  "type": "service_account",
  "project_id": "xxxxxxxx",
  "private_key_id": "290bf6bfxxxxxxxxxx9f1ae",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuQIBADANBgkqhkiG9w0BAQEFAASCBKMwggSfAgEAAoIBAQC9eiVNw2R5bZlR\nx/MSOehaVqp4moYxP6Xs5GsAfrvDRUxImmoj0ey0EEH6I3Hjmi2TEXjALYkRZuja\nw/QZlfoYk59zCnVjFyWth8txXAmz65jnoD7cGZrO6JRGY+8NWnCpg+o/FzQ8IkeX\nqxxxxxxxxWjfC7w==\n-----END PRIVATE KEY-----\n",
  "client_email": "prisma-bce-function@funxxxxxx.iam.gserviceaccount.com",
  "client_id": "1059xxxxxxxxx235",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/prisma-bce-function%40funxxxxx.iam.gserviceaccount.com"
 }

  EOF
}
   
5. Run "terraform init"
6. Run "terraform plan"
7. Check everything is acting as you expected
8. Run "terraform deploy"
9. Click the Output URL after the deployment finished, it will auto-added a random token id for authentication for the Cloud Function call
10. If the feedback is "Successful", means you have deployed the Cloud Function successfully, and tested good.
11. Copy and paste the Output URL into Palo Alto Networks Panorama for the Primsa Access IP change auto notification and automate the Google BeyondCorp access level update.
