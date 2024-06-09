In this lab you will create a frontend solution using a Rest API and Firestore database. Cloud Firestore is a NoSQL document database that is part of the Firebase platform where you can store, sync, and query data for your mobile and web apps at scale. Lab content is based on resolving a real world scenario through the use of Google Cloud serverless infrastructure.

You will build the following architecture:

![architectural System](https://cdn.qwiklabs.com/ktslVEb0iXwZo%2BJvv4WSMD3ZogKyLvKuXgU7%2FGwmol0%3D)

### Create DB FireStore
![dbfirestore](https://cdn.qwiklabs.com/%2BXTnJ7ZdcMC3Q5yJoJo9IgA0KycWEQgAlHMnQbRIHSw%3D)


### Populate DB
![popdb](https://cdn.qwiklabs.com/PKIVCpHcC1AN002C29%2FTGB5m3BLy1nvvVzv9o%2BoJPPw%3D)


### Create Rest API
![restapi](https://cdn.qwiklabs.com/%2FEEXmlifsMsOwCuZUq%2F7KYiuzoIjHgT8%2FqNBHG3WgFA%3D)

### Firestore API access
![API access](https://cdn.qwiklabs.com/%2FEEXmlifsMsOwCuZUq%2F7KYiuzoIjHgT8%2FqNBHG3WgFA%3D)

### Deploy a stagging FE
![fe](https://cdn.qwiklabs.com/m1BZ32wAOgNFZiGu0CHGt4MxL9CGTybjTY%2BEMcQjo%2Fs%3D)




## Deploy a production FE
![prod](https://cdn.qwiklabs.com/XS0ycXUPX%2BQgKX8dSq6flsOa0MLze%2FRow%2ByVRyWhT8M%3D)



### Just exec! 
```
export SERVICE_NAME=
export FRNT_STG_SRV=
export FRNT_PRD_SRV=
export REGION=
```

```
curl -LO https://raw.githubusercontent.com/imamNurC/Cloud-Data-Processing/main/Develop%20Serverless%20Apps%20with%20Firebase%3A%20Challenge%20Lab/gsp344.sh
sudo chmod +x gsp344.sh
./gsp344.sh
```
