export reg=
export zone=

gcloud auth list

gcloud config list project

gcloud config set compute/region $reg
gcloud config set compute/zone $zone



#  Create GKE Cluster 
gcloud container clusters create --machine-type=e2-medium --zone=$zone lab-cluster




gcloud container clusters get-credentials lab-cluster
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0


kubectl expose deployment hello-server --type=LoadBalancer --port 8080
kubectl get service


gcloud container clusters delete lab-cluster
