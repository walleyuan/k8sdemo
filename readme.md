docker build -t k8sdemo .\app
docker run -d -p 8080:8080 k8sdemo:latest

# Ensure you have the proper AKS credentials
az aks get-credentials -g k8s_dev -n k8scluster_dev
