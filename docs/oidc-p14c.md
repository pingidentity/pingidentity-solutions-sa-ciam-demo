Instructions for OIDC Config

Token Authentication: `client_secret_basic`

## Redirect URIs
| Product | Redirect_URI |
| --- | --- |
| PingCentral | {{PingCentralHost}}/login/oauth2/code/pingcentral |
| PingFederate | {{PFAdminURL}}/pingfederate/app?service=finishsso |

## Custom Claims

| Product | Claim Name | Value |
| --- | --- | --- |
| PingFederate | `name` | `formatted.name` | Name of Administrator |
| | pf_admin_roles | `fullAdmin` | Roles for Admin (defined in `oidc.properties`) |
| PingCentral | `pc_admin_roles` | IAM-Admin or AppOwner(defined in `application.properties)