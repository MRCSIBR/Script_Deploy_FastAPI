#!/bin/bash

# Step 1: Build Docker image
echo "Step 1: Building Docker image..."
docker build -t my-fastapi-app .

# Step 2: Run Docker container
echo "Step 2: Running Docker container..."
docker run -d -p 80:80 my-fastapi-app

# Step 3: Access your FastAPI app
echo "Step 3: Access your FastAPI app at http://localhost:80"