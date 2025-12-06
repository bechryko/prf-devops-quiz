#!/bin/bash

(minikube status && minikube stop && [ -n "" ]) ||
(
   echo "--- Starting Minikube... ---"
   minikube start
   echo "--- Minikube started, configuring Docker environment... ---"
   eval $(minikube docker-env)
   echo "--- Minikube Docker environment configured ---"
)
