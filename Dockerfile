ARG KEYCLOAK_IMAGE=quay.io/keycloak/keycloak:26.3.0


FROM ${KEYCLOAK_IMAGE} AS builder
ENV KC_DB=postgres
ENV KC_FEATURES=token-exchange,admin-fine-grained-authz
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_RELATIVE_PATH=/auth
ENV KC_CACHE_STACK=kubernetes
ENV KC_PROXY_HEADERS=xforwarded
RUN /opt/keycloak/bin/kc.sh build

FROM node:20.17.0 AS theme-builder
RUN apt-get update && apt-get install -y maven
WORKDIR /keycloak-themes
COPY keycloak-themes/package.json .
COPY keycloak-themes/yarn.lock .
RUN yarn install
COPY keycloak-themes .
RUN npm run build-keycloak-theme

FROM ${KEYCLOAK_IMAGE}
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY --from=theme-builder /keycloak-themes/dist_keycloak/keycloak-theme-for-kc-all-other-versions.jar /opt/keycloak/providers/keycloak-theme.jar
ENV KC_DB=postgres
ENV KC_FEATURES=token-exchange,admin-fine-grained-authz
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_RELATIVE_PATH=/auth
ENV KC_PROXY_HEADERS=xforwarded
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
