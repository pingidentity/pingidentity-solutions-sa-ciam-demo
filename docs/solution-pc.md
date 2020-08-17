# PingCentral - Config

To access the Admin Console for PC go to:  
`https://{{PC_HOSTNAME}}:9022`

## User Credentials (Compass)

Use the identities configured for this Environment in Compass (See [SSO with Compass](sso-compass.md))

## User Credentials (PF - LDAP)

* `Administrator` / `2FederateM0re`
* `appowner.0` / `2FederateM0re`
* `appowner.1` / `2FederateM0re`

Access to PingCentral is controlled on the `employeeType` of the PS User - it's pulled with the OIDC Policy used by the PingCentral OIDC client.

---

## Environments

PingCentral is not wired to any environment to begin with - but it will pull in the apps that are wired up in Customer360:

**PingFed Environment:**

| | |
| --- | --- |
| PingFederate Admin | `pingfederate:9999` |
| PingFederate Admin Username | `api-admin` |
| PingFederate Admin Password |  `2FederateM0re` |
