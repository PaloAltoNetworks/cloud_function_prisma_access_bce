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
5. Run "terraform init"
6. Run "terraform plan"
7. Check everything is acting as you expected
8. Run "terraform deploy"
9. Click the Output URL after the deployment finished, it will auto-added a random token id for authentication for the Cloud Function call
10. If the feedback is "Successful", means you have deployed the Cloud Function successfully, and tested good.
11. Copy and paste the Output URL into Palo Alto Networks Panorama for the Primsa Access IP change auto notification and automate the Google BeyondCorp access level update.
