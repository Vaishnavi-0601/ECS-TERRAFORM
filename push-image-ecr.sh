#!/bin/bash
AWS_REGION="us-east-1"
ECR_REPO_NAME="ecr_repo"
AWS_ACCOUNT_ID="904047573216"

# Build your Docker image
docker build -t $ECR_REPO_NAME .

#ecr login
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 904047573216.dkr.ecr.us-east-1.amazonaws.com

# Tag your Docker image with the ECR repository URI
ECR_REPO_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest"
docker tag ${ECR_REPO_NAME}:latest $ECR_REPO_URI


# Push the Docker image to ECR
docker push ${ECR_REPO_URI}


