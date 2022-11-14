
ECR_URL=$(cat ecr_baseurl)

DATABASE_NAME="dio-projeto-database"
DATABASE_TAG="1.0"
FULL_DATABASE_TAG=$ECR_URL/$DATABASE_NAME:$DATABASE_TAG

BACKEND_NAME="dio-projeto-backend"
BACKEND_TAG="1.0"
FULL_BACKEND_TAG=$ECR_URL/$BACKEND_NAME:$BACKEND_TAG

FRONTEND_NAME="dio-projeto-frontend"
FRONTEND_TAG="1.0"
FULL_FRONTEND_TAG=$ECR_URL/$FRONTEND_NAME:$FRONTEND_TAG


echo "Criação e registro das imagens"
docker build database/. -t $FULL_DATABASE_TAG && \
docker push $FULL_DATABASE_TAG

docker build backend/. -t $FULL_BACKEND_TAG && \
docker push $FULL_BACKEND_TAG

docker build frontend/. -t $FULL_FRONTEND_TAG && \
docker push $FULL_FRONTEND_TAG

echo "Configuração dos Volumes"
kubectl apply -f persistency.yml

echo "Configuração dos Serviços"
kubectl apply -f services.yml

echo "Configuração dos Deployments"

sed -i "s/DATABASE_IMAGE/$ECR_URL\/$DATABASE_NAME:$DATABASE_TAG/" deployments.yml
sed -i "s/BACKEND_IMAGE/$ECR_URL\/$BACKEND_NAME:$BACKEND_TAG/" deployments.yml
sed -i "s/FRONTEND_IMAGE/$ECR_URL\/$FRONTEND_NAME:$FRONTEND_TAG/" deployments.yml

kubectl apply -f deployments.yml

