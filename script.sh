#!/bin/bash

echo "Criando as imagens..."

docker build -t benalves-torres/projeto-backend:1.0 backend/.
docker build -t benalves-torres/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push benalves-torres/projeto-backend:1.0
docker push benalves-torres/projeto-database:1.0

echo "Criando servicos no cluster k8s..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml