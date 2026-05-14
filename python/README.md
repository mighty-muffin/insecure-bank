# Insecure Bank (python)

## Running the application locally

1. Build and run the application:

```bash
uv venv --python 3.10
python src/manage.py migrate
python src/manage.py runserver
```

2. You can then access the bank application here: <http://localhost:8000>

## Running with Docker

1. Build and run the application with Docker.

```bash
docker build -t insecure-bank-python .
docker run -p 8000:8000 -d --name insecure-bank-python insecure-bank-python
docker logs insecure-bank-python
```

2. Open the application here: <http://localhost:8000>

## Login credentials

```text
Username: john
Password: test
```
