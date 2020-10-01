# Configuration Variables

Environment variables are used to configure the solution components.

| Deployment | Environment File | Description |
| --- | --- | --- |
| **Docker Compose** | `env-vars` | Used by the DevOps Server Profiles |
| | `postman_vars` | Used by the Postman API calls |
| **Kubernetes** | `environment.yaml` (env-vars) | Used by the DevOps Server Profiles |
| | `environment.yaml` (postman_vars.json) | Used by the Postman API calls |

---

## **Server Profile Environment**

The Ping DevOps - Server Profiles use a set of Environment variables to configure the Products:

* Compose - `env_vars`
* Kubernetes - `environment.yaml`

| Variable | Description | Customer Values |
| -------- | ----------- | ------- |
| *All Products* | |
| `PING_IDENTITY_ACCEPT_EULA` | Ping Identity EULA | `YES` |
| `PING_IDENTITY_PASSWORD` | Password for PF Service Account | `2FederateM0re` |
| *Compass Portal (OIDC)* | |
| `ADMIN_CLIENT_ID` | OIDC Client ID | *Your OIDC Client ID*
| `ADMIN_CLIENT_SECRET` | OIDC Client Secret | *Your OIDC Client Secret* |
| `ADMIN_CLIENT_ISSUER` | OIDC Issuer | *Your OIDC Issuer* |
| *PingDirectory* | |
  `MAX_HEAP_SIZE` | Allocate minimum memory to PD container | `768m` |
| *PingFederate* | |
| `PF_LOG_LEVEL` | PingFed Logging Level | `INFO` or `DEBUG` |
| `USER_BASE_DN` | Root of the LDAP tree | `dc=customer360.com` |
| `PF_ADMIN_HOSTNAME` | Hostname for PF Console (used in OIDC `redirect_uri`) |*container name* |
| `PF_ADMIN_PORT` | Admin Port for PF Console (used in OIDC `redirect_uri`) | `9031` |
| `PF_ADMIN_MODE` | Administrator Logon method | `Native` or `LDAP` or `OIDC` |
| `ADMIN_CLIENT_AUTHZ` | [OIDC] AuthZ Endpoint | *OIDC Provider - AuthZ Endpoint* |
| `ADMIN_CLIENT_TOKEN` | [OIDC] Token Endpoint | *OIDC Provider - Token Endpoint* |
| `ADMIN_CLIENT_USERINFO` | [OIDC] UserInfo Endpoint | *OIDC Provider - UserInfo Endpoint* |
| `ADMIN_CLIENT_LOGOFF` | [OIDC] Logoff Endpoint | *OIDC Provider - Logoff Endpoint* |
| *PingCentral* | |
| `PING_CENTRAL_BLIND_TRUST` | Allow PingCentral to trust self-signed certs | `true` |
| `PING_CENTRAL_VERIFY_HOSTNAME` | Allow PingCentral to trust self-signed certs | `false` |
| `MYSQL_USER` | PingCentral DB User | `root` |
| `MYSQL_PASSWORD` | PingCentral DB Password | `2Federate` |
| `MYSQL_ROOT_PASSWORD` | PingCentral DB Password | `2Federate` |
| `PING_CENTRAL_OIDC_ENABLED` | PingCentral OIDC logon | `true` |
| `PING_CENTRAL_CLIENT_ID` | PingCentral OIDC Client | `PingCentral` |
| `PING_CENTRAL_CLIENT_SECRET` | PingCentral OIDC Secret | `2FederateM0re` |
| `PF_ISSUER` | PingFed OIDC Issuer | `{{Your PF Issuer}}` |

---

## **API Configuration Variables**

These variables are configured with defaults in the Postman Collection

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `pfAdminURL` | PingFed Administration URL | `https://pingfederate:9999` |
| `pdAdminUrl` | PingDir Administration URL | `https://pingdirectory:443` |
| `pfAdmin` | PingFed API Admin Account | api-admin |
| `pfAdminPwd` | PingFed Admin Password| {{globalPwd}} |
| `pdAdmin` | PingFed Admin Account | administrator |
| `pdAdminPwd` | PingDir Admin Password| {{globalPwd}} |
| `pfAuthnApiUrl` | PF AuthN App URL | `{{pfBaseURL}}/pf-ws/authn/explorer` |
| `globalPwd` | Common Password | 2FederateM0re |
| `googleAppID` | Used in PF Google CIC | `YourGoogleAppID` |
| `googleAppSecret` | Used in PF Google CIC | `YourGoogleAppSecret` |
| `fbAppID` | Used in PF Facebook CIC | `YourFBAppID` |
| `fbAppSecret` | Used in PF Facebook CIC | `YourFBAppSecret` |
| `pingCentralHost` | Used for PF OAuthAS CORS | `https://pingcentral:9022` |
| `pingOneAuthNURL` | Used for the P1 AuthN URL | `https://auth.pingone.com` |
| `pingOneMgmtURL` | Used for the P1 Mgmt URL | `https://auth.pingone.com` |
| `pingOneEnvId` | Your PingOne MFA EnvId | `YourP1EnvId` |
| `pfWorkerId` | Your PingOne Ping Platform WorkerId | `YourPFWorkerId` |
| `pfWorkerSecret` | Your PingOne Ping Platform WorkerSecret | `YourPFWorkerSecret` |
| `mfaPopId` | Your PingOne PopId for MFA Users | `YourMfaPopId` |
| `mfaAppId` | Your PingOne MFA User AppId | `YourMfaAppId` |
| `mfaAppSecret` | Your PingOne MFA User AppId | `YourMfaAppSecret` |

---

Any of the above variables can be overwritten by placing them in the appropriate deployment file:

* Compose - `postman_vars.json`
* Kubernetes - `environment.yaml`

These variables need to be set with specific values for your environment:

| Variable | Description | Customer Values |
| -------- | ----------- | ------- |
| `pfBaseURL` | PingFed Runtime URL | `https://{{Your PF public FQDN}}:9031` |
| `pingIdSdk` | PingID SDK Properties  | *Your SDK Properties file* |
| `sdkAppId` | PID SDK Application ID | *Your SDK App ID* |
