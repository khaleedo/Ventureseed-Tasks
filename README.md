# Ventureseed Tasks

This repository contains tasks completed as part of the Ventureseed AI Infrastructure Engineer interview process. It showcases the deployment of an AI-powered CLI application using AWS services, emphasizing Infrastructure as Code (IaC), CI/CD pipelines, and scalable cloud architecture.

## Repository Structure

- `App/`: Flask application serving AI inference endpoints.
- `IAC-Terraform/`: Terraform scripts for provisioning AWS infrastructure.
- `cloud-proposal/`: Proposal for migrating an open-source AI project to the cloud.
- `.github/workflows/`: GitHub Actions workflows for CI/CD.

## Deployment Overview

The application is containerized using Docker and deployed on AWS EC2 instances. Infrastructure provisioning is managed via Terraform, ensuring reproducibility and scalability. CI/CD pipelines are set up using GitHub Actions to automate testing and deployment processes.

## Getting Started

To deploy the application:

1. Navigate to the `IAC-Terraform/` directory.
2. Initialize Terraform:
   ```bash
   terraform init

