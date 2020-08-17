# Post-Deployment Considerations

This Solution leverages **unsecured** LDAP between PingFederate and PingDirectory as it launches.  

To enabled LDAPS, follow these steps:

## **Command Line**

1. Export the PingDirectory certificate

    * Compose --
       * `docker-compose exec pingdirectory /opt/out/instance/bin/manage-certificates export-certificate --keystore /opt/out/instance/config/keystore --keystore-password-file /opt/out/instance/config/keystore.pin --alias server-cert --output-file server-cert.crt --output-format PEM`

    * Kubernetes --
       * Connect to the Service -- `kubectl exec -it service/pingdirectory /bin/sh`
       * Execute this command -- `/opt/out/instance/bin/manage-certificates export-certificate --keystore /opt/out/instance/config/keystore --keystore-password-file /opt/out/instance/config/keystore.pin --alias server-cert --output-file server-cert.crt --output-format PEM`

2. Copy the certificate from the PingDirectory container

    * Compose --
      * Get the Container names -- `docker container ls` - retrieve the Container IDs for PingDirectory and PingFederate
      * `docker cp {{pingdirectoryId}}:/opt/server-cert.crt ./server-cert.crt`
    * Kubernetes --
      * Get the Container names -- `kubectl get pods` - retrieve the Container IDs for PingDirectory and PingFederate
      * `kubectl cp {{pingdirectoryId}}:/opt/server-cert.crt ./server-cert.crt`

### **PingFederate Admin Console**

1. Import the PingDirectory certificate into PingFederate
    * Open the Trusted CA store
      * `Security` --> `Trusted CAs`
    * Import the `server-cert.crt` file

2. Edit the PingDirectory DataStore
    * `System` --> `External Systems -- DataStores` --> `PingDirectory` --> `LDAP Configuration`
    * Check the `Use LDAPS` box
    * Test the Connection

### **Disable LDAP on PingDirectory**

* Compose --
  * `docker-compose exec pingdirectory /opt/out/instance/bin/dsconfig set-connection-handler-prop --handler-name "LDAP Connection Handler" --set enabled:false --no-prompt`
* Kubernetes --
  * `kubectl exec service/pingdirectory /opt/out/instance/bin/dsconfig set-connection-handler-prop --handler-name "LDAP Connection Handler" --set enabled:false --no-prompt`
  