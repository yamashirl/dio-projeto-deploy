
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

docker build database/. -t $FULL_BACKEND_TAG && \
docker push $FULL_BACKEND_TAG

docker build database/. -t $FULL_FRONTEND_TAG && \
docker push $FULL_FRONTEND_TAG


