# The Cloud Function to auto sync the Prisma Access Node IP List with BeyondCorp Access Level

1. Clone this repo to your local machine or Google Cloud Shell.
2. Use gcloud config list to ensure you have login with your Google Account
3. Type "gcloud auth application-default login" to let your local application to temporarily use your own user credentials for API access. Or you can use "gcloud auth application-default login --client-id-file=clientid.json" to login by passing in a file containing your own client id
4. Update the variables in the var.tf
5. ### Place Holder ###
6. Run "terraform init"
7. Run "terraform plan"
8. Check everything is acting as you expected
9. Run "terraform deploy"
10. Click the Output URL after the deployment finished, it will auto-added a random token id for authentication for the Cloud Function call
11. If the feedback is "Successful", means you have deployed the Cloud Function successfully, and tested good.
12. Copy and paste the Output URL into Palo Alto Networks Panorama for the Primsa Access IP change auto notification and automate the Google BeyondCorp access level update.
