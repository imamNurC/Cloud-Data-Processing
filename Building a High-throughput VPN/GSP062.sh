

# Creating Cloud VPC


export REGION=europe-west1
export REGION2=us-central1
export MY_SECRET=sharedsecret
export ZONE=europe-west1-b
export ZONE2=us-central1-c



gcloud compute networks create cloud --subnet-mode custom
gcloud compute firewall-rules create cloud-fw --network cloud --allow tcp:22,tcp:5001,udp:5001,icmp
gcloud compute networks subnets create cloud-east --network cloud \
    --range 10.0.1.0/24 --region $REGION


#Creating on-prem VPC


gcloud compute networks create on-prem --subnet-mode custom
gcloud compute firewall-rules create on-prem-fw --network on-prem --allow tcp:22,tcp:5001,udp:5001,icmp
gcloud compute networks subnets create on-prem-central \
    --network on-prem --range 192.168.1.0/24 --region $REGION2


#==============================================

# Creating VPN Gateways

gcloud compute target-vpn-gateways create on-prem-gw1 --network on-prem --region $REGION2
gcloud compute target-vpn-gateways create cloud-gw1 --network cloud --region $REGION


# Creating a route-based VPN tunnel between local and Google Cloud networks
gcloud compute addresses create cloud-gw1 --region $REGION
gcloud compute addresses create on-prem-gw1 --region $REGION2


cloud_gw1_ip=$(gcloud compute addresses describe cloud-gw1 \
    --region $REGION --format='value(address)')
on_prem_gw_ip=$(gcloud compute addresses describe on-prem-gw1 \
    --region $REGION2 --format='value(address)')


gcloud compute forwarding-rules create cloud-1-fr-esp --ip-protocol ESP \
    --address $cloud_gw1_ip --target-vpn-gateway cloud-gw1 --region $REGION

gcloud compute forwarding-rules create cloud-1-fr-udp500 --ip-protocol UDP \
    --ports 500 --address $cloud_gw1_ip --target-vpn-gateway cloud-gw1 --region $REGION


gcloud compute forwarding-rules create cloud-fr-1-udp4500 --ip-protocol UDP \
    --ports 4500 --address $cloud_gw1_ip --target-vpn-gateway cloud-gw1 --region $REGION


## Forward the ESP protocol from on-prem-gw1


gcloud compute forwarding-rules create on-prem-fr-esp --ip-protocol ESP \
    --address $on_prem_gw_ip --target-vpn-gateway on-prem-gw1 --region $REGION2
gcloud compute forwarding-rules create on-prem-fr-udp500 --ip-protocol UDP --ports 500 \
    --address $on_prem_gw_ip --target-vpn-gateway on-prem-gw1 --region $REGION2
gcloud compute forwarding-rules create on-prem-fr-udp4500 --ip-protocol UDP --ports 4500 \
    --address $on_prem_gw_ip --target-vpn-gateway on-prem-gw1 --region $REGION2



#----================================================


gcloud compute vpn-tunnels create on-prem-tunnel1 --peer-address $cloud_gw1_ip \
    --target-vpn-gateway on-prem-gw1 --ike-version 2 --local-traffic-selector 0.0.0.0/0 \
    --remote-traffic-selector 0.0.0.0/0 --shared-secret=$MY_SECRET --region $REGION2

gcloud compute vpn-tunnels create cloud-tunnel1 --peer-address $on_prem_gw_ip \
    --target-vpn-gateway cloud-gw1 --ike-version 2 --local-traffic-selector 0.0.0.0/0 \
    --remote-traffic-selector 0.0.0.0/0 --shared-secret=$MY_SECRET --region $REGION

gcloud compute routes create on-prem-route1 --destination-range 10.0.1.0/24 \
    --network on-prem --next-hop-vpn-tunnel on-prem-tunnel1 \
    --next-hop-vpn-tunnel-region $REGION2

gcloud compute routes create cloud-route1 --destination-range 192.168.1.0/24 \
    --network cloud --next-hop-vpn-tunnel cloud-tunnel1 --next-hop-vpn-tunnel-region $REGION



#======================================================================


#  Testing throughput over VPN


## Single VPN load testing

gcloud compute instances create "cloud-loadtest" --zone $ZONE \
    --machine-type "e2-standard-4" --subnet "cloud-east" \
    --image-family "debian-11" --image-project "debian-cloud" --boot-disk-size "10" \
    --boot-disk-type "pd-standard" --boot-disk-device-name "cloud-loadtest"

gcloud compute instances create "on-prem-loadtest" --zone $ZONE2 \
    --machine-type "e2-standard-4" --subnet "on-prem-central" \
    --image-family "debian-11" --image-project "debian-cloud" --boot-disk-size "10" \
    --boot-disk-type "pd-standard" --boot-disk-device-name "on-prem-loadtest"

sleep 30


 ## Open SSH each vm
sudo apt-get install iperf
iperf -s -i 5
iperf -c 192.168.1.2 -P 20 -x C




