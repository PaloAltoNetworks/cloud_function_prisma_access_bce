# The Cloud Function to auto sync the Prisma Access Node IP List with BeyondCorp Access Level
 -- This is developed by Palo Alto Networks GCP Techinical Engagement Team
 
## Prerequisites
1. Terraform v1.0.4
2. Prisma Access v2.0 +
3. Google BeyondCorp
4. Google Admin Web access

## Deployment Guide
1. Clone this repo to your local machine or Google Cloud Shell.
2. Use gcloud config list to ensure you have login with your Google Account
3. Type "gcloud auth application-default login" to let your local application to temporarily use your own user credentials for API access. Or you can use "gcloud auth application-default login --client-id-file=clientid.json" to login by passing in a file containing your own client id
4. Create or use your existing Google Cloud Storage Bucket, and upload the function-source.zip file to the bucket, ensure the credential you provided in Step 3 have the read authority.
5. Update the variables in the var.tf

   5.1 Go to Google Cloud Console -> Security -> Access Context Manager, if you don't have an Access Level yet, please create one. For example, see below:
       ![image](https://user-images.githubusercontent.com/52453932/128668202-5e459a51-7921-4730-9327-72a7f137d8ca.png)
       access_policy_id is: 515250846142
       
      access_level_id: prisma_access_address
   
   5.2 Go to Google Cloud Console -> IAM & Admin -> Service Accounts -> Create a new Service Account (no permisson or role needed), copy the Unique ID, you will needed this later. Create an Access Key of the Service Account, and download the JSON file. Open the JSON file and copy the content into the var.tf variable "cred_json", like below:
![image](https://user-images.githubusercontent.com/52453932/128848694-52519e0c-7bc0-4a25-bdfd-c8648ec76b09.png)
       Now you needed to go to Google Admin Site to grant this service account for the Google Admin API Call scope. 
       Go to Google Admin (https://admin.google.com/), login with your administrator account. Go to Security -> API Controls -> Add new client by click Add New.
       Import the Unique ID you copied previously, and add the OAuth scope: https://www.googleapis.com/auth/cloud-platform, like below:
       ![image](https://user-images.githubusercontent.com/52453932/128851617-99584c7d-8428-4272-9b29-87f81fc0bcbe.png)


       
   5.3 Update the variable: source_bucket to be the bucket you put the function-source.zip file, and update the variable: source_object to be the file name (function-source.zip).
   
   5.4 Update the Variable: prisma_api_key. You can get this through Palo Alto Networks Panorama Console: Panorama -> Cloud Service -> Configuration, click "Generate API key". 
   
   5.5 Update other normal variable accordingly to the descriptions. 
   
   
6. Run "terraform init"
7. Run "terraform plan"
8. Check everything is acting as you expected
9. Run "terraform deploy"
10. Click the Output URL after the deployment finished, it will auto-added a random token id for authentication for the Cloud Function call
11. If the feedback is "Successful", means you have deployed the Cloud Function successfully, and tested good.
12. Copy and paste the Output URL into Palo Alto Networks Panorama for the Primsa Access IP change auto notification and automate the Google BeyondCorp access level update. You can do this through Palo Alto Networks Panorama Console: Panorama -> Cloud Service -> Configuration, click "IP Change Event Notification URL"
