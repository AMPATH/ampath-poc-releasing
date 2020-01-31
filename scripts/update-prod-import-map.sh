#!/bin/bash
if [ "$DEPLOY_PROD" = "1" ]
then
    cd ./prod/openmrs/frontend/
    STATUS_CODE=$(curl --output /dev/null --write-out %{http_code} -u $DEPLOYER_USERNAME:$DEPLOYER_PASSWORD -d '@import-map.json' -X PATCH $DEPLOYER_HOST/import-map.json\?env=prod -H "Accept:application/json" -H "Content-Type:application/json")
    echo $STATUS_CODE
else
    echo 200
fi