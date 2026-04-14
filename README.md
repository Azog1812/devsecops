# DevSecOps Project – 5DVSCOPS 2025/2026

A DevSecOps CI/CD pipeline using GitHub Actions to secure a Flask API application.

## Project Structure

```
├── app.py                         # Flask API application
├── requirements.txt               # Python dependencies
├── Dockerfile                     # Docker image definition
├── k8s/
│   └── deployment.yaml            # Kubernetes manifests
├── policy/
│   └── deny_root.rego             # Conftest/Rego security policies
├── .yamllint                      # YAML linting configuration
└── .github/
    └── workflows/
        └── ci.yml                 # GitHub Actions CI/CD pipeline
```

## Pipeline Jobs

| Job | Tool | Purpose |
|-----|------|---------|
| YAML Lint | yamllint | Validate YAML file syntax and style |
| Docker Build | docker | Build the container image |
| Trivy FS Scan | Trivy | Scan dependencies (requirements.txt) |
| Trivy Image Scan | Trivy | Scan Docker image for CVEs |
| Conftest Policy | Conftest | Enforce Kubernetes security policies |

## Security Policies

The Conftest policy (`policy/deny_root.rego`) enforces:
- No container should run as root (UID 0)
- All containers must define a `securityContext`
- Privileged containers trigger a warning
