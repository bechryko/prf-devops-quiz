#!/bin/bash

echo "--- Clean up all pods: ---"
minikube kubectl -- delete --all pods

echo "--- Clean up all deployments: ---"
minikube kubectl -- delete --all deployments

echo "--- Clean up all services: ---"
minikube kubectl -- delete --all services

echo "--- Deleting successful! ---"
echo "--- Remaining pods: ---"
minikube kubectl -- get pods
echo "--- Remaining services: ---"
minikube kubectl -- get services
