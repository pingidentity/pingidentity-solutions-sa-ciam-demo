# Version History

## Version 2.1.0 - 9/30/2020

**Repo Changes**

* Added PF Integration Kits
  * PingOne MFA v 1.0
  * PingOne IK v 2.0
  * Reference Adapter v 2.0.1
* Helm chart \ instructions added
* Updated K8s yamls
* My Ping integration in PingFed \ PingCentral

**API Collection**

* PingID SDK config replaced with PingOne MFA
* SCIM v2 added to PingDir

---

## Version 2.0 - 7/1/2020

**Software Images**

* PingFederate v10.1
* PingDirectory v8.1
* PingCentral v1.4

**Repo Changes**

* OIDC SSO for PingFed Admin UI
* Added PingCentral Startup Hook to delay start until PingFed is actually ready

**API Collection**

* `EXPRESSIONS_ADMIN` role added to API Admin account
* OIDC Client for PF Admin Console - `PingAdmin`
* Redirectless AuthN API enabled on `PingLogon` OIDC client

---

## Version 1.3 - 4/24/2020

**Repo Changes**

* Added GitHub Connector
* Added PingOne for Customer IK
* Added OAuth Playground v4.2

**API Collection**

* Account Registration pre-populates with Social data (FB or Google)
* `payload` added to Tracked HTTP Parameters (for PingID SDK Mobile Apps)

---

## Version 1.2 - 4/20/2020

**Repo Changes**

* Repo updated to include PingCentral services

**API Collection**

* PingFed
  * PingCentral OIDC Client \ Policy
  * HTML Form Adapter
  * `Internal` AuthN Policy flow - for non-Customer facing AuthN
  * `PingServices` OAuth Client_Credentials client
  * Client Credentials Access Token Mapping
* PingDir
  * Users for PingCentral

Version 1.1 - 4/10/2020
=
* PingFed Server Profile updated to include:
  * Google Adapter
  * Facebook Adapter
  * Apple Adapter
  * LinkedIn Adapter
  * Reference Adapter (1.5.1 --> 1.5.4)
* API Collection updated to include:
  * Enabled QR-Code in PID SDK Adapter
  * Added Google Adapter (`googleAppId` \ `googleAppSecret` in Variables)
  * Added FB Adapter (`fbAppID` \ `fbAppSecret` in Variables)
  * Added Policy Actions for FB \ Google \ QR Code
    * AuthN Policy
    * Fallback Policy

Version 1.0 - 3/13/2020
=
* Initial Publish