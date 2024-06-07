export PROJECT_ID=$(gcloud config get-value project)

gcloud config set project $PROJECT_ID


gcloud compute firewall-rules delete open-access



gcloud compute firewall-rules create $iap_net_tag --allow=tcp:22 --source-ranges 35.235.240.0/20 --target-tags $iap_net_tag --network acme-vpc
gcloud compute instances add-tags bastion --tags=$iap_net_tag --zone=$ZONE

gcloud compute firewall-rules create $http_net_tag --allow=tcp:80 --source-ranges 0.0.0.0/0 --target-tags $http_net_tag --network acme-vpc
gcloud compute instances add-tags juice-shop --tags=$http_net_tag --zone=$ZONE

gcloud compute firewall-rules create $internal_net_tag --allow=tcp:22 --source-ranges 192.168.10.0/24 --target-tags $internal_net_tag --network acme-vpc
gcloud compute instances add-tags juice-shop --tags=$internal_net_tag --zone=$ZONE
