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



