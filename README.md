# n8n-aws-eb-blank-template

This repository provides a secure, ready-to-deploy setup for [n8n](https://n8n.io) on **AWS Elastic Beanstalk** using Docker.

## Features

- Uses the official n8n Docker image
- Secure authentication via environment variables
- Easily configurable via `.env`
- Ready to attach a domain and SSL certificate
- Ideal for consultants and automation experts

## Getting Started

1. Clone the repository
2. Configure your environment variables using `.env.example`
3. Deploy to Elastic Beanstalk with `eb init` and `eb create`
4. Point your domain and attach SSL using AWS ACM

---

Template created and maintained by [Ángel Díaz-Maroto Álvarez](https://dmtransformation.com)  
Licensed under the MIT License.