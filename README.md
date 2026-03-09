# Quantum Research DevOps Platform 

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)
![Ansible](https://img.shields.io/badge/Config-Ansible-red?logo=ansible)
![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-blue?logo=kubernetes)
![Docker](https://img.shields.io/badge/Container-Docker-blue?logo=docker)
![AWS](https://img.shields.io/badge/Cloud-AWS-orange?logo=amazonaws)

## Project Overview

### This project demonstrates the design and implementation of a cloud-native DevOps platform for running scalable quantum computing simulations.

### The platform provisions infrastructure, configures compute nodes, deploys a Kubernetes cluster, and provides a system for executing quantum simulation workloads in a distributed environment.

### The goal of this project is to simulate how research laboratories or deep-tech companies working in quantum computing could run scientific workloads using modern DevOps and cloud-native technologies.

---

### Problem Statement
Scientific computing workloads such as quantum simulation often requires
 - scalable compute infrastructure
 - reproducible environments
 - automated deployment workflows
 - monitoring and observability
 - efficient resource utilization
Managing these environments manually is complex and error-prone.

This project demonstrates how DevOps pratices can automate the procisioning, configuration, and orchestration of a research computing platform.

---

## Architecture

The platform is composed of multiple layers that automate infrastructure provisioning, cluster configuration, and workload execution.

---

## Infrastructure Provisioning

Infrastructure is provisioned using **Terraform**, which automatically creates the required AWS resources:

- VPC networking
- Security groups
- EC2 instances
- S3 storage

The infrastructure consists of **three compute nodes** used to build a Kubernetes cluster:

- 1 Kubernetes control plane node
- 2 Kubernetes worker nodes

Using Infrastructure as Code ensures the platform is **reproducible, scalable, and version-controlled**.

---

## Configuration Management

The infrastructure is configured using **Ansible**.

Ansible automates the following tasks:

- Operating system configuration
- Container runtime installation
- Kubernetes components installation
- Cluster initialization using `kubeadm`
- Network configuration using Flannel CNI

This enables rapid deployment of a fully configured Kubernetes cluster.

---

## Kubernetes Cluster

The platform runs a **self-managed Kubernetes cluster** deployed using `kubeadm`.

Cluster architecture:

- Control plane node
- Two worker nodes

Kubernetes is used to orchestrate containerized simulation workloads using **Kubernetes Jobs**.

---

## Application Layer

The application layer consists of a containerized **quantum simulation service**.

The simulator is implemented in Python using the **Qiskit framework**, which allows simulation of quantum circuits.

The application is packaged into a Docker container and executed as Kubernetes Jobs across worker nodes.

---

## Technology Stack

### Infrastructure
- Terraform
- AWS (EC2, VPC, S3)

### Configuration Management
- Ansible

### Containerization
- Docker

### Container Orchestration
- Kubernetes (kubeadm)

### Backend
- Python
- FastAPI

### Quantum Simulation
- Qiskit

### Observability (Planned)
- Prometheus
- Grafana

---

## Future Improvements

Planned improvements for the platform include:

- CI/CD pipeline with GitHub Actions
- Kubernetes cluster autoscaling
- Monitoring and observability with Prometheus and Grafana
- Automated worker node joining
- Experiment result storage and tracking