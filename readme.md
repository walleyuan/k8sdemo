docker build -t k8sdemo .\app
docker run -d -p 8080:8080 k8sdemo:latest
