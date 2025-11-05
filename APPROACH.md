# Architecture and Design Decisions

## Overview
This document explains the architectural decisions and implementation approach taken for this fullstack demo project.

## Frontend Architecture
- **Technology**: React + Vite for a modern, efficient development experience
- **Deployment**: Vercel chosen for:
  - Zero-configuration deployment
  - Automatic builds and deployments
  - Built-in CDN and edge caching
  - Cost-effective for static content
  - No need for Load Balancer as static content is served via CDN
- **Source**: Available in `frontend/` directory

## Backend Architecture
- **Technology**: Express.js REST API 
- **Endpoint**: Available at `bharatmali.store/api/hello`
- **Containerization**: 
  - Dockerfile created for consistent deployments
  - Container runs on port 80 for HTTP traffic
- **Source**: Available in `backend/` directory

## Infrastructure Setup (secondary-infra/)
### VPC Configuration
- Public and private subnets across multiple AZs
- Internet Gateway for public access
- NAT Gateway for private subnet outbound traffic
- Route tables configured for proper network isolation

### Database (RDS)
- Dedicated subnet group for RDS instance
- Small instance type chosen for testing/demo purposes

### ECS Setup
- ECS Cluster configured for container orchestration
- Task Definition includes:
  - Container configuration
  - Resource limits
  - Port mappings
- Security groups attached for controlled access

### Domain & SSL
- Current Setup:
  - Backend runs on HTTP (port 80)
  - Domain `bharatmali.store` points to ECS task IP
- Note on HTTPS:
  - Currently not implemented
  - To enable HTTPS (port 443):
    1. Would need Application Load Balancer
    2. SSL certificate from AWS Certificate Manager (ACM)
    3. Update security groups for HTTPS traffic

## CI/CD Pipeline
- Located in `.github/workflows/`
- Automated triggers for specific events
- Handles build and deployment processes

## Cost Considerations
- Deliberately avoided Load Balancer to minimize costs
- Using Vercel's free tier for frontend hosting
- Small RDS instance for demo purposes
- Minimal ECS configuration

## Production Optimizations Needed
1. Implement HTTPS using ALB and ACM
2. Remove hardcoded values and use environment variables
3. Implement proper secrets management
4. Add monitoring and logging
5. Setup auto-scaling policies
6. Implement proper backup strategies for RDS
7. Add WAF and other security measures

## Networking Flow
```
Client -> Vercel CDN -> Frontend
Client -> ECS Task (Port 80) -> Backend API
Backend -> RDS (Private Subnet)
```

## Future Improvements
1. Load Balancer for high availability
2. Multiple ECS tasks for redundancy
3. HTTPS implementation
4. Proper CI/CD with staging environments
5. Monitoring and alerting setup
6. Automated backup and disaster recovery









