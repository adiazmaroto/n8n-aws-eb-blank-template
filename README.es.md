# Plantilla de despliegue seguro de n8n en AWS EB

Este repositorio te permite desplegar n8n en AWS Elastic Beanstalk de forma segura y profesional usando Docker.

## Características

- Imagen oficial de n8n vía Docker Hub
- Autenticación básica protegida por variables de entorno
- Listo para enlazar con dominio propio y certificado SSL
- Ideal para consultores y automatizadores

## Instrucciones básicas

1. Clona el repositorio
2. Crea tu archivo `.env` a partir del `.env.example`
3. Despliega con `eb init` y `eb create`
4. Configura tu dominio y certificado SSL con ACM

---

Plantilla creada y mantenida por [Ángel Díaz-Maroto Álvarez](https://dmtransformation.com)  
Licencia MIT.