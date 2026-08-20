# Task 4 — Automated Infrastructure as Code & Kubernetes Orchestration

## Overview

A hands-on DevOps project focused on deploying and orchestrating a containerized Node.js application using Terraform and Kubernetes (Minikube).

## Technologies

- Terraform
- Kubernetes
- Minikube
- Docker
- NGINX Ingress
- Metrics Server

## What I Implemented

- Provisioned Kubernetes resources using Terraform (HCL)
- Deployed the Dockerized Node.js application with 2 replicas
- Configured a Kubernetes Service
- Added Persistent Volume Claim (PVC)
- Configured NGINX Ingress
- Implemented Horizontal Pod Autoscaling (HPA)
- Configured CPU resource requests and limits
- Verified application access and Kubernetes resource health

## Architecture

Dockerized Node.js Application  
↓  
Kubernetes Deployment  
↓  
Service  
↓  
NGINX Ingress  
↓  
Application

HPA automatically scales the application between 2 and 5 replicas based on CPU utilization.

## Verification

Terraform confirmed:

> No changes. Your infrastructure matches the configuration.

Application response:

> Hello! My DevOps application is running.