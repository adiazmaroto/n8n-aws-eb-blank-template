#!/bin/bash

set -e

APP_NAME="n8n-eb"
ENV_NAME="n8n-env"
REGION="eu-west-1"
PLATFORM="Docker running on 64bit Amazon Linux 2023"

# Este script automatiza el despliegue de n8n en AWS Elastic Beanstalk

echo "🚀 Verificando herramientas necesarias..."

if ! command -v aws &> /dev/null; then
  echo "❌ AWS CLI no está instalada. Por favor instálala primero: https://docs.aws.amazon.com/cli/"
  exit 1
fi

if ! command -v eb &> /dev/null; then
  echo "❌ EB CLI no está instalada. Por favor instálala primero: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html"
  exit 1
fi

echo "✅ Herramientas OK."

# Crear .env si no existe
if [ ! -f .env ]; then
  echo "📝 Creando archivo .env desde .env.example..."
  cp .env.example .env
fi

# Empaquetar env y Dockerrun
ZIP_NAME="app-$(date +%y%m%d_%H%M%S).zip"
echo "📦 Empaquetando aplicación como $ZIP_NAME ..."
zip -r $ZIP_NAME Dockerrun.aws.json .env > /dev/null

# Inicializar EB si no está inicializado
if [ ! -d ".elasticbeanstalk" ]; then
  echo "⚙️ Inicializando Elastic Beanstalk..."
  eb init $APP_NAME --platform "$PLATFORM" --region $REGION
fi

# Crear entorno si no existe
if ! eb status $ENV_NAME &> /dev/null; then
  echo "🌱 Creando nuevo entorno Elastic Beanstalk..."
  eb create $ENV_NAME
else
  echo "🔄 Entorno ya existe. Realizando despliegue..."
fi

# Desplegar la aplicación
echo "🚀 Desplegando la aplicación..."
eb deploy $ENV_NAME

echo "✅ Despliegue completado. Abriendo aplicación..."
eb open