# Deploy Customer360 using Helm

Helm is a package deployment tool for Kubernetes. It can be used with [Customer360](../Kubernetes) to deploy all the components of the Solution with a simple command.

1. Install Helm

    ```shell
    brew install helm
    ```

2. Add Helm Repo

    ```shell
    helm repo add pingidentity-solutions https://cprice-ping.github.io/pingidentity-solutions-helm/
    ```

3. List Ping Solutions Charts

    ```shell
    helm search repo pingidentity-solutions
    ```

4. Update local machine with latest charts

    ```shell
    helm repo update
    ```

5. Create a `values.yaml` file
    * Simple (Vanilla config - No Admin SSO \ No P1 Services)

        ```yaml
        # Default values for Customer360.
        global:
        license:
            useDevOpsKey: true
            devOpsKey:
            user: "YourDevOpsUser"
            key: "YourDevOpsKey"
            acceptEULA: "YES"
        ```

    * Full Customer360 environment (My Ping | Admin SSO \ PingOne MFA) -  sample [values.yaml](./values.yaml)

6. Install Customer360

    ```shell
    helm install {{Release Name}} pingidentity-solutions/customer360 -f values.yaml
    ```

## Accessing Deployments

Components of the release will be prefixed with your `{{Release Name}}`

Once installed, use `kubectl` to access the workloads:

View Services / Pods:

```shell
kubectl get pods | services
```

View Logs:

```shell
kubectl logs -f service/{{Release Name}}-{{Product}}
```

For example:

```hell
`kubectl logs -f service/c360-myhelmrelease-pingfederate
```

View configuration API calls:

```shell
kubectl logs -f job/{{Release Name}}-pingconfig
```

### Admin Console URLs

Admin consoles will be available at:

`https://{{Product}}-{{Release Name}}.ping-devops.com`

| Ping Product | Admin Console URL |
| ----- | ----- |
| PingFederate | `https://pingfederate-{{Release Name}}.ping-devops.com/pingfederate` |
| PingAccess | `https://pingaccess-{{Release Name}}.ping-devops.com` |
| PingCentral | `https://pingcentral-{{Release Name}}.ping-devops.com` |
| PingDirectory | `https://pingdataconsole-{{Release Name}}.ping-devops.com/console` |
| PingDataSync | `https://pingdataconsole-{{Release Name}}.ping-devops.com` |
| PingDataGov | `https://pingdataconsole-{{Release Name}}.ping-devops.com/console` |
| PingDataGov-PAP | `https://pingdatagov-pap-{{Release Name}}.ping-devops.com` |
