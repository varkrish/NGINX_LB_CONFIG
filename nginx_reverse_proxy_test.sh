#!/bin/bash

# Create custom network
podman network create corp_network

# Invoke podman Compose for ocp.compose.yaml
echo "Starting containers from ocp.compose.yaml..."
podman compose -f ocp.compose.yaml up -d

# Invoke podman Compose for tkgi.compose.yaml
echo "Starting containers from tkgi.compose.yaml..."
podman compose -f tkgi.compose.yaml up -d



# Wait for containers to be up and running
sleep 10

# Run curl command in a loop 10 times
for ((i=1; i<=100; i++)); do
    echo "Attempt $i:"
    curl http://localhost:8080 >> response.txt # Replace with actual endpoint to test
    sleep 1
done
