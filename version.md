Version 1.3 - 4/24/2020
=
* Repo Additions:
  * Added GitHub Connector
  * Added PingOne for Customer IK
  * Added OAuth Playground v4.2

* API Collection updated:
  * Account Registration pre-populates with Social data (FB or Google)
  * `payload` added to Tracked HTTP Parameters (for PingID SDK Mobile Apps)


Version 1.2 - 4/20/2020
=
* Repo updated to include PingCentral services
* API Collection updated:
  * PingFed
    *  PingCentral OIDC Client \ Policy
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