# ☁️ DevOps Monitoring Stack on AWS

## 🔧 What This Project Does

- Provisions EC2 + S3 bucket via Terraform
- Runs Dockerized Flask app exposing Prometheus metrics
- Deploys on k3s Kubernetes cluster
- Installs Prometheus + Grafana for monitoring
- Full CI/CD via GitHub Actions

## 🧱 Stack

| Tool | Purpose |
|-------------|----------------------------|
| Terraform | Infrastructure provisioning |
| AWS EC2/S3 | Hosting + storage |
| Docker | Containerization |
| k3s | Kubernetes orchestration |
| Prometheus | Metrics scraping |
| Grafana | Visualization dashboard |
| GitHub Actions | CI/CD Pipeline |

## 🌍 URLs

- **Flask App:** `http://<ec2-ip>:30500`
- **Prometheus:** `http://<ec2-ip>:30900`
- **Grafana:** `http://<ec2-ip>:30300` (login: admin/admin)

## ✅ Setup

- Push to GitHub repo
- Set GitHub Secrets:
- `EC2_HOST`
- `EC2_SSH_KEY`
- GitHub Actions will deploy everything
