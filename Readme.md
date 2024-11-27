docker-compose up --build -d
docker compose down
docker image prune -f

gcloud run deploy user-microservice-fastapi --image user-microservice-fastapi

<!-- Deploy using code build -->

gcloud run deploy user-microservice-fastapi --source .
