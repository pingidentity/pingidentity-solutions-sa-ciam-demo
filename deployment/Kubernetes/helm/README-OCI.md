# Kubernetes deployment with Helm

If you'd prefer to deploy into a kubernetes cluster using Helm:

1. Install Helm 3

    ```shell
    brew install helm
    ```

2. Enabled OCI Support

    ```shell
    export HELM_OCI_EXPERIMENTAL=1
    ```

3. Pull the latest Helm chart for Customer360

    ```shell
    helm chart export pingsolutions.azurecr.io/helm/customer360:latest .
    ```

4. Deploy a Release

      a) Customer360 should deploy with default, generic values - with Console logon configured for LDAP (PF) and Native (PA \ PC \ PD)

    ```shell
    helm upgrade --install {{Your Release Name}} ./customer360
    ```

    b) With a `[values.yaml](./values.yaml)` file, you can pre-configure Customer360 with My Ping Console \ SSO into PA \ PC \ PF and PingOne MFA details

    ```shell
    helm upgrade --install {{Your Release Name}} ./customer360 -f values.yaml
    ```
