#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=jagadeesh8877/operationalize_ml_prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run prediction --image=docker.io/${dockerpath} --labels="app=prediction"


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
DEPLOYED_POD=$(kubectl get pods -l app=prediction -o jsonpath='{.items[0].metadata.name}')
kubectl port-forward "${DEPLOYED_POD}" 8000:80
