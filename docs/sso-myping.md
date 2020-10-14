# Instructions for Admin SSO via My Ping Console

"My Ping" is the Ping Deployment Console that gives you a single place to Manage and Access all of your Ping Environment(s) - Software and Services. SSO into your Administration Console is achieved by OIDC - using PingOne as the token provider.

## PingOne Console configuration

For now, there's a set of manual steps you need to make in your PingOne tenant - for your environments, you only need to do this once.

1. Create an Environment for your Env Admin SSO configuration
2. Extend the Directory to add new Attributes -- P1 doesn't support Groups, and Software doesn't handle GroupDNs well. C360 hardcodes values into the Software SSO config (see below)
3. Create new Web App Connection
4. Map the extended attributes to the Attribute Mapping in the Connection
5. Add Administrator Users - add the values (see below) to the Users

---

* Directory (Settings --> Directory --> Attributes)
  * Select **Add Attribute**
  * Choose **Declared** - to hold the values of the claims that authorize access to Products

    | Attribute Name | Display Name |
    | --- | --- |
    | `pf-admin-roles`| PingFed Admin Roles |
    | `pc-admin-roles` | PingCentral Admin Roles |

* Create new Connection:
  * Select **Add Application**
  * Choose **Web App**, then **OIDC**
  * Configure `redirect_uri` as shown in the table below
    * Note: Each Product has a different format for the `redirect_uri` - PingFed and PingCentral use their `.properties` file to create it.

    | Product | Redirect_URI |
    | --- | --- |
    | PingCentral | `{{PingCentralHost}}/login/oauth2/code/pingcentral` |
    | PingFederate | `{{PFAdminURL}}/pingfederate/app?service=finishsso` |
    | PingAccess (6.2 Beta) | `{{PAAdminURL}}/pa/oidc/cb` |

  * In **Attribute Mapping** add the following attributes

    | P1 User Attribute | Application Attribute |
    | --- | --- |
    | Formatted | Name |
    | PingFed Admin Roles | `pf-admin-roles` |
    | PingCentral Admin Roles | `pc-admin-roles` |
    | User ID | `sub` |

  * Select your new application in the overview page and click **Edit** (the pencil icon)
  * Select **Configuration**
  * Configure **Token Endpoint Authentication Method**: `Client Secret Basic` (PingCentral requirement)

* Administrator Identities (Identities)
  * Create Administrator account
  * Populate the Roles on the Administrator Identities with the value mapped in the Product properties (See below)
    * look for **Other** and find the attribute Display Names that you have created earlier

    | Product | Claim Name | Value |
    | --- | --- | --- |
    | PingFederate | `name` | `formatted.name` | Name of Administrator |
    | | `pf-admin-roles` | `fullAdmin` | Roles for Admin (defined in `oidc.properties`) |
    | PingCentral | `pc-admin-roles` | `IAM-Admin` or `AppOwner`(defined in `application.properties)
