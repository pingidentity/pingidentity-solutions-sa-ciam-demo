#!/usr/bin/env sh
#
# Ping Identity DevOps - Docker Build Hooks
#

if test "${1}" = "start-server" ; then
#    ${PF_HOST:=localhost}
#    ${PF_PORT:=9031}
#    ${PF_CLIENT_ID:=dadmin}

    echo "
##################################################################################
#               Ping Identity DevOps Delegator Web Application
##################################################################################
# 
#     Configured with the following values.  
# 
#       PF_HOST: ${PF_HOST}
#       PF_PORT: ${PF_PORT}
#       PF_CLIENT_ID: ${PF_CLIENT_ID}
#       PD_HOST: ${PD_HOST}
#       PD_PORT: ${PD_PORT}
# 
#     To set via a docker run or .yaml just set them using examples below
#
#    docker run
#           ...
#           --env PF_HOST=myhost.mydomain.com
#           ...
#
#      To use with '.yaml' file (use snippet below)
#
#    pingdirectory:
#       environment: PF_HOST=myhost.mydomain.com
##################################################################################
"

    cd /usr/share/nginx/html/delegator || echo "Unable to cd to the delegator html directory"

    sed -e "s#PF_HOST = 'localhost'#PF_HOST = '${PF_HOST}'#" \
        -e "s#PF_PORT = '9031'#PF_PORT = '${PF_PORT}'#" \
        -e "s#DADMIN_CLIENT_ID = 'dadmin'#DADMIN_CLIENT_ID = '${PF_CLIENT_ID}'#" \
        -e "s#// window.DS_HOST = 'undefined'#window.DS_HOST = '${PD_HOST}'#" \
        -e "s#// window.DS_PORT = 'undefined'#window.DS_PORT = '${PD_PORT}'#" \
        "example.config.js" > "config.js"

    chmod 644 "config.js"

    cd /
    nginx -g 'daemon off;'
else
    exec "$@"
fi