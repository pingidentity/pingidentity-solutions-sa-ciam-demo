# Kubernetes Deployment

## Pre-requisites

* Access to a Kuberenetes Cluster \ Namespace
* Ping GSA DevOps toolkit -- `brew install ping-devops`
* Create your secret file  

```bash
ping-devops generate devops-secret > devops-secret-secret.yaml
```

You'll use this file in all your deployments  
**NOTE:**  Be careful not to upload to GitHub in your Profile(s)

## Configuration

### **Modify [Environment Variables](../environment.md)**

* Copy the `yaml` files to a folder (include your `devops-secret-secret.yaml`)
* Modify the [environment.yaml](environment.yaml) file to match your environment (`env-vars` and `postman_vars.json` are combined in this file)

### **Modify Ingress Controllers**

* Modify the [ingress.yaml](ingress.yaml) --> Admin Consoles to point your Namespace records
* Modify the [ingress.yaml](ingress.yaml) --> PingAccess to point your Client FQDN

### **Deploy Services**

* Launch the stack with `kubectl apply -f .`
* Logs for the configuration can be watched with `kubectl logs -f job/pingconfig`
* Logs for the stack can be watched with `kubectl logs -f service/{{service}}`

---

### Ingress Controllers

In order to get access into the Kubernetes services, Ingress Controllers need to be defined.  
![Kubernetes - Ingress Controllers](PingSolutions-K8s-Deployments.png)

**Note:** You will need to edit the Ingress `yaml` files to reflect your Namespace \ DNS records

A standard Ingress Controller is used to grant access to the Ping Admin consoles:

| Ping Product | Admin Console URL |
| ----- | ----- |
| PingFederate | `https://pingfederate-{{your eks namespace}}.ping-devops.com/pingfederate` |
| PingAccess | `https://pingaccess-{{your eks namespace}}.ping-devops.com` |
| PingCentral | `https://pingcentral-{{your eks namespace}}.ping-devops.com` |
| PingDirectory | `https://pingdataconsole-{{your eks namespace}}.ping-devops.com/console` |
| PingDataSync | `https://pingdataconsole-{{your eks namespace}}.ping-devops.com/console` |
| PingDataGov | `https://pingdataconsole-{{your eks namespace}}.ping-devops.com` |
| PingDataGov-PAP | `https://pingdatagov-pap-{{your eks namespace}}.ping-devops.com` |

[Ingress Controller - Ping Admin Consoles](ingress.yaml)

Another Ingress Controller is used to send all **client** traffic to the PingAccess Service:  

[Ingress Controller - Ping Access](ingress.yaml)
