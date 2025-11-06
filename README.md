# Demo Fullstack Repo

Project overview
- This repository contains a simple fullstack demo:
  - frontend: a React + Vite application located in `frontend/`. Intended to be served on Vercel.
  - backend: a Node.js service (entry: `backend/server.js`) located in `backend/`. Packaged with Docker and deployed to AWS ECS.
  - infrastructure: Terraform configuration to deploy the backend and related infra is in `seconday-infra/`.

Directory layout
- frontend/ — React + Vite app (source: `frontend/src/`)
- backend/ — Node.js service with `Dockerfile` and `server.js`
- seconday-infra/ — Terraform code that provisions VPC, RDS, ECS, security groups and outputs for deployment

Prerequisites
- Node.js (for local frontend/backend dev)
- npm or yarn
- Docker (for building and testing the backend image)
- AWS CLI configured with appropriate credentials
- Terraform (to manage infra)
- Vercel account (for frontend hosting)

Frontend (frontend/)
- Tech: React + Vite
- Local dev:
  - cd frontend
  - npm install
  - npm run dev
- Build for production:
  - npm run build
- Deploy:
  - Import the repository/project into Vercel or connect via GitHub and configure the build command (`npm run build`) and the output directory (`dist/`)

Backend (backend/)
- Tech: Node.js (simple HTTP/Express service). Packaged with Docker for deployment.
- Local dev:
  - cd backend
  - npm install
  - npm start
- Build Docker image and run locally:
  - docker build -t demo-backend .
  - docker run -p 3000:3000 demo-backend
- Deploy to ECS:
  - Push the Docker image to an image registry (ECR / Docker Hub)
  - Use the Terraform in `seconday-infra/` to create ECS resources and run the service

Infrastructure (seconday-infra/)
- Purpose: provisions AWS resources required to run the backend on ECS (VPC, RDS, ECS cluster/task, security groups, etc.)
- Key files:
  - provider.tf — AWS provider configuration
  - vpc.tf — VPC, subnets, NAT, etc.
  - rds.tf — RDS database (if used)
  - ecs.tf — ECS cluster, task definition, service
  - security_groups.tf — security group rules
  - variables.tf  — variables
- Typical workflow:
  - cd seconday-infra
  - terraform init
  - terraform plan -var-file="secrets.tfvars"
  - terraform apply -var-file="secrets.tfvars"
- Notes:
  - Provide AWS credentials via environment variables or a named profile.
  - Keep sensitive values (DB password, image auth) outside source control (use `*.tfvars` ignored by git).

Environment variables
- Frontend:
  - Set the backend API base URL used by the frontend (e.g. REACT_APP_API_URL or VITE_API_URL depending on setup)
- Backend:
  - PORT, DATABASE_URL or DB_HOST/DB_USER/DB_PASS as required by the service
  - When running in ECS, these are typically injected via task definition or secrets manager

Running the full stack locally
1. Start backend:
   - cd backend && npm install && npm start
2. Start frontend:
   - cd frontend && npm install && npm run dev
3. Point the frontend to the local backend (update the frontend env variable to http://localhost:3000)

Further notes
- The Terraform and deployment steps assume familiarity with AWS, ECR, ECS and Vercel. Adjust configurations to match your AWS account, region, and naming conventions.
- For production deployments, secure secrets using AWS Secrets Manager / Parameter Store and enable appropriate IAM permissions.

Quick links
- frontend/ — React app
- backend/ — Node.js + Docker service
- seconday-infra/ — Terraform infra for ECS deployment

