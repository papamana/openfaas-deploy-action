FROM openfaas/faas-cli:0.11.3

ARG GATEWAY_URL_DEV
ARG GATEWAY_URL_STAGING
ARG GATEWAY_URL_PROD
ARG GATEWAY_USERNAME_DEV
ARG GATEWAY_PASSWORD_DEV
ARG GATEWAY_USERNAME_STAGING
ARG GATEWAY_PASSWORD_STAGING
ARG GATEWAY_USERNAME_PROD
ARG GATEWAY_PASSWORD_PROD
ARG DOCKER_USERNAME
ARG DOCKER_PASSWORD
ARG DOCKER_REGISTRY_URL=""
ARG DOCKER_USERNAME_2=""
ARG DOCKER_PASSWORD_2=""
ARG DOCKER_REGISTRY_URL_2=""
ARG CUSTOM_TEMPLATE_URL=""
ARG BUILD_ARG_1_NAME
ARG BUILD_ARG_1
ARG AUTH_TOKEN_DEV
ARG AUTH_TOKEN_STAGING
ARG AUTH_TOKEN_PROD
ARG SCHEDULED_REDEPLOY_FUNCS

ENV GATEWAY_URL_DEV=${GATEWAY_URL_DEV}
ENV GATEWAY_URL_STAGING=${GATEWAY_URL_STAGING}
ENV GATEWAY_URL_PROD=${GATEWAY_URL_PROD}
ENV GATEWAY_USERNAME_DEV=${GATEWAY_USERNAME_DEV}
ENV GATEWAY_PASSWORD_DEV=${GATEWAY_PASSWORD_DEV}
ENV GATEWAY_USERNAME_STAGING=${GATEWAY_USERNAME_STAGING}
ENV GATEWAY_PASSWORD_STAGING=${GATEWAY_PASSWORD_STAGING}
ENV GATEWAY_USERNAME_PROD=${GATEWAY_USERNAME_PROD}
ENV GATEWAY_PASSWORD_PROD=${GATEWAY_PASSWORD_PROD}
ENV DOCKER_USERNAME=${DOCKER_USERNAME}
ENV DOCKER_PASSWORD=${DOCKER_PASSWORD}
ENV DOCKER_REGISTRY=${DOCKER_REGISTRY_URL}
ENV DOCKER_USERNAME=${DOCKER_USERNAME_2}
ENV DOCKER_PASSWORD=${DOCKER_PASSWORD_2}
ENV DOCKER_REGISTRY=${DOCKER_REGISTRY_URL_2}
ENV CUSTOM_TEMPLATE_URL=${CUSTOM_TEMPLATE_URL}
ENV BUILD_ARG_1=${BUILD_ARG_1}
ENV BUILD_ARG_1_NAME=${BUILD_ARG_1_NAME}
ENV AUTH_TOKEN_DEV=${AUTH_TOKEN_DEV}
ENV AUTH_TOKEN_STAGING=${AUTH_TOKEN_STAGING}
ENV AUTH_TOKEN_PROD=${AUTH_TOKEN_PROD}
ENV SCHEDULED_REDEPLOY_FUNCS=${SCHEDULED_REDEPLOY_FUNCS}

RUN apk add docker
RUN apk add bash
RUN apk add curl
RUN apk update

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
