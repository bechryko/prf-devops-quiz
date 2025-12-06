#!/bin/bash
set -e

echo "--- Creating config maps... ---"
(kubectl create configmap prf-devops-quiz-proxy-config --from-file=nginx.conf || [ -n " " ])

echo "--- Starting Skaffold... ---"
skaffold run

echo "--- Opening application in browser... ---"
minikube service prf-devops-quiz-proxy
