This solution is designed to be deployed in either:
* [Docker Compose](./Compose)
* [Kubenetes](./Kubernetes)

### Configuration Variables
The API Collections used to configure the solution components contain a set of defaults - these can be overwritten byt using any appropriate environment file:

| Deployment | Environment File | Description |
| --- | --- | --- |
| **Docker Compose** | `env_vars` | Used by the Container images |
| | `postman_vars` | Used by the API calls |
| **Kubernetes** | `env-vars-configmap.yaml` | Used by the Container images |
| | `pingconfig-cm0-configmap.yaml` | Used by the API calls |

**Server Profile Environment**

`env_vars` || `env-vars-configmap.yaml`

| Variable | Description | Customer Values |
| -------- | ----------- | ------- |
| `PING_IDENTITY_ACCEPT_EULA` | Ping Identity EULA | YES |
| `PF_LOG_LEVEL` | PingFed Logging Level | INFO or DEBUG |
| `USER_BASE_DN` | Root of the LDAP tree | dc=customer360.com |
| `PF_USER_PWD` | Password for PF Service Account | `pfAdminPwd` |
| `PING_CENTRAL_BLIND_TRUST` | Allow PingCentral to trust self-signed certs | `true` |
| `PING_CENTRAL_VERIFY_HOSTNAME` | Allow PingCentral to trust self-signed certs | `false` |
| `MYSQL_USER` | PingCentral DB User | `root` |
| `MYSQL_PASSWORD` | PingCentral DB Password | `2Federate` |
| `MYSQL_ROOT_PASSWORD` | PingCentral DB Password | `2Federate` |
| `PING_CENTRAL_OIDC_ENABLED` | PingCentral OIDC logon | `true` |
| `PING_CENTRAL_CLIENT_ID` | PingCentral OIDC Client | `PingCentral` |
| `PING_CENTRAL_CLIENT_SECRET` | PingCentral OIDC Secret | `2FederateM0re` |
| `PF_ISSUER` | PingFed OIDC Issuer | `{{Your PF Issuer}}` |

**API Configuration Variables**

*Collection Defaults*

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `pfAdminURL` | PingFed Administration URL | https://pingfederate:9999 |
| `pdAdminUrl` | PingDir Administration URL | https://pingdirectory:443 |
| `pfAdmin` | PingFed API Admin Account | api-admin |
| `pfAdminPwd` | PingFed Admin Password| {{globalPwd}} |
| `pdAdmin` | PingFed Admin Account | cn=dmanager |
| `pdAdminPwd` | PingDir Admin Password| {{globalPwd}} |
| `pfAuthnApiUrl` | PF AuthN App URL | {{pfBaseURL}}/pf-ws/authn/explorer |
| `globalPwd` | Common Password | 2FederateM0re |

Any of the above variables can be overwritten by placing them in the appropriate deployment file below.

`postman_vars.json` || `pingconfig-cm0-configmap.yaml`

| Variable | Description | Customer Values |
| -------- | ----------- | ------- |
| `pfBaseURL` | PingFed Runtime URL | https://{{your PF public FQDN}}:9031 |
| `pingIdSdk` | PingID SDK Properties  | Your SDK Properties file |
| `sdkAppId` | PID SDK Application ID | Your SDK App ID |
