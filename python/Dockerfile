FROM python:3.10-alpine3.20

ARG GIT_COMMIT="1234567"
ARG REPO_URL=""

ENV GIT_COMMIT=${GIT_COMMIT}
ENV REPO_URL=${REPO_URL}

ENV PATH=".venv/bin:$PATH"

ADD . .

EXPOSE 8000

RUN apk add --no-cache tini
RUN python install
RUN python src/manage.py migrate

ENTRYPOINT [ "tini", "--" ]
CMD ["python", "src/manage.py",  "runserver", "0.0.0.0:8000"]
