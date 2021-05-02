# run terraform for pervisioning resources
terraform init
terraform apply -auto-approve

# build docker locally
docker build -t k8sdemo .\app
docker run -d -p 8080:8080 k8sdemo:latest

# Ensure you have the proper AKS credentials
az aks get-credentials -g k8s_dev -n k8scluster_dev

# Create secret key
kubectl create secret docker-registry k8sregistrykey --docker-server=https://k8sdemocr.azurecr.io --docker-username=k8sdemoCR --docker-password= --docker-email=yuan_connie@msn.com

# Steps for update code
  1. update code
  2. update azure-pipelines.yml version & container