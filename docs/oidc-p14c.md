# Instructions for Admin SSO via Compass

Compass is the Ping Deployment Console that gives you a single place to Manage and Access all of your Ping Environments - Software and Services. SSO into your Administration Console is achieved by OIDC - using P14C as the token provider.

## PingOne for Customer configuration


Token Authentication: `client_secret_basic` (PingCentral requirement)

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