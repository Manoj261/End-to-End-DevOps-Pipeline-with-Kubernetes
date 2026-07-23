# End-to-End DevOps Pipeline with Kubernetes

## Project Overview

This project demonstrates a complete End-to-End DevOps CI/CD pipeline using GitHub, Jenkins, Docker, Kubernetes, Terraform, Ansible, and AWS EC2.

The pipeline automates the process of building, containerizing, publishing, and deploying a web application to a Kubernetes cluster.

---

## GitHub Repository

Repository used in the Jenkins Pipeline:

**https://github.com/Manoj261/website-devops**

The Jenkins pipeline continuously monitors the **main** branch of this repository.

Whenever code is pushed to the repository, Jenkins automatically:

- Checks out the latest source code.
- Builds a Docker image using the Dockerfile.
- Pushes the Docker image to Docker Hub.
- Deploys the updated application to the Kubernetes cluster.

---

## Architecture

```
                   +----------------------+
                   |      Developer       |
                   +----------+-----------+
                              |
                              v
                   +----------------------+
                   |  GitHub Repository   |
                   +----------+-----------+
                              |
                              v
                   +----------------------+
                   |  Jenkins Pipeline    |
                   +----------+-----------+
                              |
                  +-----------+-----------+
                  |                       |
                  v                       v
         Docker Image Build       Run Pipeline Stages
                  |                       |
                  +-----------+-----------+
                              |
                              v
                   +----------------------+
                   |     Docker Hub       |
                   +----------+-----------+
                              |
                              v
                   +----------------------+
                   | Kubernetes Cluster   |
                   +----------+-----------+
                              |
                              v
                   +----------------------+
                   | NodePort Service     |
                   |      (30008)         |
                   +----------+-----------+
                              |
                              v
                   +----------------------+
                   |  Web Application     |
                   +----------------------+
```

Infrastructure provisioning is performed using **Terraform**.

Server configuration is automated using **Ansible**.

---

## Technologies Used

- AWS EC2
- Ubuntu Server Pro
- Terraform
- Ansible
- Jenkins
- Docker
- Docker Hub
- Kubernetes
- Git & GitHub
- Ubuntu Linux

---

## Features

- Infrastructure as Code (IaC) using Terraform
- Automated Configuration Management using Ansible
- Jenkins CI/CD Pipeline
- Docker Image Creation
- Docker Hub Integration
- Kubernetes Deployment
- Rolling Updates
- Kubernetes Deployment with **2 Replicas**
- NodePort Service (**30008**)

---

## Prerequisites

- AWS Account
- Ubuntu Server Pro EC2 Instance
- AWS CLI
- Terraform
- Ansible
- Jenkins
- Docker
- Kubernetes
- kubectl
- Git

---

# Initial Setup

## Step 1: Launch an EC2 Instance

Create an AWS EC2 instance using:

- **Ubuntu Server Pro 24.04**

Connect to the instance using EC2 Instance Connect.

---

## Step 2: Install Required Tools

Give execute permission to the installation script.

chmod u+x install_tools.sh

Run the script as root.

sudo ./install_tools.sh

The script installs:

- Git
- Java
- Jenkins
- Terraform
- Ansible

Verify the installation.

git --version
java --version
terraform --version
ansible --version

---

## Step 3: Create Infrastructure

Navigate to the Terraform directory.

cd Terraform

Initialize Terraform.

terraform init

Validate the configuration.

terraform validate

Generate an execution plan.

terraform plan

Create the infrastructure.

terraform apply

After the infrastructure is created, note the EC2 instance IP addresses.

---

## Step 4: Configure Infrastructure

Navigate to the Ansible directory.

Update the inventory file (`Hosts.txt`) with the private IP addresses of the EC2 instances.

Run the Ansible playbook to install Docker and Kubernetes.

ansible-playbook play.yaml

---

## Step 5: Initialize Kubernetes

On the Kubernetes Master node:

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

Generate the worker join command.

sudo kubeadm token create --print-join-command

Execute the generated command on each worker node.

Verify the cluster.

kubectl get nodes

---

## Step 6: Configure Jenkins

- Install the required plugins.
- Configure Docker Hub credentials.
- Configure SSH credentials.
- Create a Pipeline Job.
- Use the provided `pipeline` (Jenkinsfile).

---

## Step 7: Push Code to GitHub

Whenever changes are pushed to the **main** branch:

git add .
git commit -m "Update project"
git push origin main

Jenkins automatically:

- Checks out the latest code.
- Builds the Docker image.
- Pushes the image to Docker Hub.
- Deploys the updated application to Kubernetes.

---

## Pipeline Workflow

GitHub Push
      │
      ▼
Jenkins Pipeline
      │
      ▼
Docker Image Build
      │
      ▼
Push Image to Docker Hub
      │
      ▼
Kubernetes Deployment
      │
      ▼
NodePort Service (30008)
      │
      ▼
Web Application


---

## Kubernetes Configuration

### Deployment

- Replicas: **2**

### Service

- Type: **NodePort**
- Container Port: **80**
- NodePort: **30008**

---

## Repository

### GitHub

https://github.com/Manoj261/website-devops

---

## License

This project is created for educational and learning purposes to demonstrate an End-to-End DevOps CI/CD pipeline using AWS, Terraform, Ansible, Jenkins, Docker, and Kubernetes.
