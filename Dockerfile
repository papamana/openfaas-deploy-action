FROM openfaas/faas-cli:0.11.3

ARG GATEWAY_URL_STAGING
ARG GATEWAY_URL_PROD
ARG GATEWAY_USERNAME_STAGING
ARG GATEWAY_PASSWORD_STAGING
ARG GATEWAY_USERNAME_PROD
ARG GATEWAY_PASSWORD_PROD
ARG DOCKER_USERNAME
ARG DOCKER_PASSWORD
ARG DOCKER_REGISTRY_URL
ARG CUSTOM_TEMPLATE_URL
ARG GITHUB_USERNAME
ARG GITHUB_PASSWORD

ENV GATEWAY_URL_STAGING=${GATEWAY_URL_STAGING}
ENV GATEWAY_URL_PROD=${GATEWAY_URL_PROD}
ENV GATEWAY_USERNAME_STAGING=${GATEWAY_USERNAME_STAGING}
ENV GATEWAY_PASSWORD_STAGING=${GATEWAY_PASSWORD_STAGING}
ENV GATEWAY_USERNAME_PROD=${GATEWAY_USERNAME_PROD}
ENV GATEWAY_PASSWORD_PROD=${GATEWAY_PASSWORD_PROD}
ENV DOCKER_USERNAME=${DOCKER_USERNAME}
ENV DOCKER_PASSWORD=${DOCKER_PASSWORD}
ENV DOCKER_REGISTRY=${DOCKER_REGISTRY_URL}
ENV CUSTOM_TEMPLATE_URL=${CUSTOM_TEMPLATE_URL}
ENV GITHUB_USERNAME=${GITHUB_USERNAME}
ENV GITHUB_PASSWORD=${GITHUB_PASSWORD}

RUN apk add docker
RUN apk add bash
RUN apk update

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
