# Insecure Bank (java-mvn)

## Running the application locally

1. Build and run the application:

```bash
mvn clean package
mvn cargo:run
```

2. You can then access the bank application here: <http://localhost:8080/insecure-bank/>

## Running with Docker

1. Build and run the application with Docker.

```bash
docker build -t insecure-bank-java-mvn .
docker run -p 8080:8080 -d --name insecure-bank-java-mvn insecure-bank-java-mvn
docker logs insecure-bank-java-mvn
```

2. Open the application in > <http://localhost:8080/insecure-bank>

## Login credentials

```text
Username: john
Password: test
```
