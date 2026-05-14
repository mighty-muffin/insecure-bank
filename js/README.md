# Insecure Bank (nodejs)

## Running the application locally

1. Build and run the application:

```bash
npm install
npm run start
```

2. You can then access the bank application here: <http://localhost:3000>

## Running with Docker

1. Build and run the application with Docker.

```bash
docker build -t insecure-bank-js .
docker run -p 3000:3000 -d --name insecure-bank-js insecure-bank-js
docker logs insecure-bank-js
```

2. Open the application here: <http://localhost:3000>

## Login credentials

```text
Username: john
Password: test
```

## Update to `node:18.20-slim`

```dockerfile
FROM node:18.20-slim

# Install build dependencies for native modules
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
```
