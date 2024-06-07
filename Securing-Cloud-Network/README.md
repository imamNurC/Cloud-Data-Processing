## the firewall rules, make sure that:

- The bastion host does not have a public IP address.
- You can only SSH to the bastion and only via IAP.
- You can only SSH to juice-shop via the bastion.
- Only HTTP is open to the world for juice-shop.


## Tips and tricks:

Pay close attention to the network tags and the associated VPC firewall rules.
Be specific and limit the size of the VPC firewall rule source ranges.
Overly permissive permissions will not be marked correct.



```
export ZONE=
export iap_net_tag=
export http_net_tag=
export internal_net_tag=
```

```
curl -LO https://raw.githubusercontent.com/imamNurC/Cloud-Data-Processing/main/Securing-Cloud-Network/gcp-net.sh
chmod +x gcp-net.sh
./gcp-net.sh
```


## Securing Online Shop Scheme

![boiston-juice](https://cdn.qwiklabs.com/BgxgsuLyqMkhxmO3jDlkHE7yGLIR%2B3rrUabKimlgrbo%3D)
