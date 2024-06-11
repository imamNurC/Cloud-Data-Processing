gcloud auth list

gcloud config list project

export PROJECT_ID=
export BUCKET_NAME=


gcloud config set compute/region REGION
mkdir gcf_hello_world
cd gcf_hello_world

touch index.js

sleep 10

echo "

/**
* Background Cloud Function to be triggered by Pub/Sub.
* This function is exported by index.js, and executed when
* the trigger topic receives a message.
*
* @param {object} data The event payload.
* @param {object} context The event metadata.
*/
exports.helloWorld = (data, context) => {
const pubSubMessage = data;
const name = pubSubMessage.data
    ? Buffer.from(pubSubMessage.data, 'base64').toString() : "Hello World";

console.log(`My Cloud Function: ${name}`);
};

" >> index.js

sleep 5

gsutil mb -p $PROJECT_ID gs://$BUCKET_NAME


## pwd = /gcf_hello_world/
# Deploy The funtion

gcloud services disable cloudfunctions.googleapis.com

gcloud services enable cloudfunctions.googleapis.com

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member="serviceAccount:$PROJECT_ID@appspot.gserviceaccount.com" \
--role="roles/artifactregistry.reader"


gcloud functions deploy helloWorld \
  --stage-bucket $BUCKET_NAME \
  --trigger-topic hello_world \
  --runtime nodejs20

gcloud functions describe helloWorld


# Test the Function


DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'

# View logs

gcloud functions logs read helloWorld














