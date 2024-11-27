docker-compose up --build -d
docker compose down
docker image prune -f

gcloud run deploy user-microservice-fastapi --image user-microservice-fastapi

<!-- Deploy using code build -->

gcloud run deploy user-microservice-fastapi --source .

<!-- If terraform plan is not working due to access token issue-->

gcloud auth application-default login

<!-- if new provider added -->

terraform init -upgrade

<!-- get gcloud token for test -->

gcloud auth print-identity-token

<!-- POSTMAN set Authorization Bearer TOKEN and send GET request to cloud run URL -->
