# Insecure Bank (dotnet)

## Running the application locally

1. Build and run the application:

```bash
dotnet build
dotnet run
```

2. You can then access the bank application here: <http://localhost:5000>

## Running with Docker

1. Build and run the application with Docker.

```bash
docker build -t insecure-bank-dotnet .
docker run -p 5000:80 -d --name insecure-bank-dotnet insecure-bank-dotnet
docker logs insecure-bank-dotnet
```

Open the application here: <http://localhost:5000>

## Login credentials

```text
Username: john
Password: test
```
