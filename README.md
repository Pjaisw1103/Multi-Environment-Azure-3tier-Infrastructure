# 🌐 Multi-Environment Azure Infrastructure Setup

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=250&text=Multi-Environment%20Azure%20Infrastructure&fontSize=38&fontAlignY=40&desc=Terraform%20%7C%20Azure%20DevOps%20%7C%20Enterprise%20Architecture&descAlignY=60&fontColor=ffffff&animation=fadeIn&color=0:0078D4,50:623CE4,100:0D1117"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Microsoft%20Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white"/>
  <img src="https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white"/>
  <img src="https://img.shields.io/badge/Azure%20DevOps-0078D7?style=for-the-badge&logo=azuredevops&logoColor=white"/>
  <img src="https://img.shields.io/badge/Infrastructure%20as%20Code-IaC-success?style=for-the-badge"/>
</p>

---

## 📌 Overview

Enterprise-grade **3-Tier Azure Infrastructure** built using Terraform and Azure DevOps.

This project demonstrates how to provision and manage **Development, Staging, and Production environments** using reusable Terraform modules and automated CI/CD workflows.

### Key Objectives

* Multi-Environment Infrastructure
* Infrastructure as Code (IaC)
* Secure Networking
* Automated Deployments
* High Availability Architecture
* Enterprise Cloud Governance

---

## 🏗️ Architecture Diagram

<p align="center">
  <img src="./Screenshot%202026-06-11%20111246.png" alt="Azure Enterprise Architecture"/>
</p>

---

## ✨ Core Components

| Layer                 | Services                                                  |
| --------------------- | --------------------------------------------------------- |
| 🌐 Networking         | VNet, Subnets, NSGs, Azure NAT Gateway, Private Endpoints |
| ⚖️ Traffic Management | Application Gateway, Internal Load Balancer               |
| 💻 Compute            | Frontend & Backend Virtual Machines                       |
| 🔐 Security           | Azure Bastion, Key Vault                                  |
| 🗄️ Database          | Azure SQL Server & Database                               |
| 📊 Monitoring         | Azure Monitor, Log Analytics                              |
| 🚀 Automation         | Terraform + Azure DevOps                                  |

---

## 🌍 Environment Strategy

```text
Development
│
├── Small Compute Resources
├── Rapid Testing
└── Frequent Deployments

QA / Staging
│
├── Production-like Environment
├── Validation & UAT
└── Release Verification

Production
│
├── High Availability
├── Secure Configuration
└── Business Critical Workloads
```

---

## 🔄 CI/CD Pipeline

```mermaid
flowchart LR

A[GitHub / Azure Repos Push]
--> B[Terraform Validate]

B --> C[Security Scan]

C --> D[Terraform Plan]

D --> E[Dev Deployment]

E --> F[QA Deployment]

F --> G[Manual Approval]

G --> H[Production Deployment]
```

### Pipeline Features

* Terraform Validation & Formatting Check
* Security Scanning (tfsec)
* Automated Dev & QA Deployment
* Production Governance & Approval Gates
* Remote State Backend Management

---

## 📂 Repository Structure

```text
.
├── Environment/
│   ├── dev/
│   ├── qa/
│   └── prod/
├── Module/
│   ├── azurerm_application_gateway/
│   ├── azurerm_bastion/
│   ├── azurerm_database/
│   ├── azurerm_internal_loadbalancer/
│   ├── azurerm_nat_gateway/
│   ├── azurerm_niclb_association/
│   ├── azurerm_publicip/
│   ├── azurerm_resource_group/
│   ├── azurerm_virtual_machine/
│   └── azurerm_virtual_network/
├── Pipeline/
│   ├── dev.yml
│   ├── qa.yml
│   ├── prod.yml
│   └── multi-env.yml
└── README.md
```

---

## 🚀 Deployment Workflow

### Clone Repository

```bash
git clone https://github.com/Pjaisw1103/Multi-Environment-Azure-Infrastructure-Setup.git
cd Multi-Environment-Azure-Infrastructure-Setup
```

### Login to Azure

```bash
az login
```

### Navigate to Environment

```bash
cd Environment/dev
```

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Generate Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply -auto-approve
```

---

## 📊 Project Highlights

<p align="center">

<img src="https://img.shields.io/badge/3--Tier-Architecture-0078D4?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Multi--Environment-Dev%20%7C%20Stage%20%7C%20Prod-623CE4?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Azure-Best%20Practices-success?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Terraform-Modular%20Design-orange?style=for-the-badge"/>

</p>

---

## 🎯 Learning Outcomes

* Enterprise Azure Architecture Design
* Terraform Module Development
* Azure Networking & Security
* Azure SQL & Private Endpoints
* CI/CD with Azure DevOps
* Infrastructure Automation

---

## 👩‍💻 Author

**Priya Jaiswal**

Azure Cloud | DevOps | Terraform

<p align="center">
  <a href="https://github.com/Pjaisw1103">
    <img src="https://img.shields.io/badge/GitHub-Pjaisw1103-181717?style=for-the-badge&logo=github"/>
  </a>

  <a href="https://linkedin.com/in/priya-jaiswal1103">
    <img src="https://img.shields.io/badge/LinkedIn-Priya%20Jaiswal-0078D4?style=for-the-badge&logo=linkedin"/>
  </a>
</p>

---

<p align="center">
⭐ If you found this project useful, consider giving it a star.
</p>
