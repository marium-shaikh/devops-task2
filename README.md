# DevOps Task 3 – Multi-Stage Automated CI/CD Deployment Pipeline

Implemented an automated CI/CD pipeline using GitHub Actions.

## What I Did

- Configured GitHub Actions to run automatically on every push
- Set up an Ubuntu runner with Node.js 24
- Installed application dependencies
- Added ESLint for static code analysis
- Added Jest and Supertest for unit testing
- Tested the `/health` endpoint automatically
- Built the Docker image as part of the pipeline
- Verified pipeline execution status and logs through GitHub Actions

## Pipeline Flow

**Push → Checkout → Node.js Setup → Install Dependencies → Lint → Unit Tests → Docker Build**


# DevOps Task 2 – Application Containerization & Asset Optimization

This project is a simple Node.js application containerized using Docker.

## What I Did

- Created a Node.js application
- Created a Dockerfile
- Built and ran the Docker image
- Used Docker Compose
- Added environment variables using `.env`
- Added a health check for the application
- Used `.gitignore` to keep `.env` and `node_modules` out of GitHub


## How to Run

Run:

docker compose up --build

Then open:

http://localhost:3000

## Health Check

The application health can be checked at:

http://localhost:3000/health



