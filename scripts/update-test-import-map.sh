#!/bin/bash
if [ "$TRAVIS_BRANCH" == "deploy-prod" ]
then
    cd ./test/openmrs/frontend/
    STATUS_CODE=$(curl --output /dev/null --write-out %{http_code} -u $DEPLOYER_USERNAME:$DEPLOYER_PASSWORD -d '@import-map.json' -X PATCH $DEPLOYER_HOST/import-map.json\?env=test -H "Accept:application/json" -H "Content-Type:application/json")
    echo $STATUS_CODE
else
    echo 200
fi