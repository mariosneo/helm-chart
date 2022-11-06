#!/bin/bash -
helm lint

EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
   
   echo "Lint failed"
   
fi 


helm package helm-chart


helm repo index helm-chart --url https://mariosneo.github.io/helm-chart --merge index.yaml

exit $EXIT_CODE