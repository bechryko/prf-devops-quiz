#!/bin/bash

kubectl apply -f kubernetes/client.yaml
kubectl apply -f kubernetes/server.yaml
kubectl apply -f kubernetes/mongo.yaml

echo "--- Running Kubectl pods: ---"
kubectl get pods

echo "--- Running Kubectl services: ---"
kubectl get services
