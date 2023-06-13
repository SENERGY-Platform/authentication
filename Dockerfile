FROM quay.io/keycloak/keycloak:21.1.1 as builder
ENV KC_DB=postgres
ENV KC_FEATURES token-exchange,admin-fine-grained-authz
ENV KC_HTTP_ENABLED true
ENV KC_HOSTNAME_STRICT false
ENV KC_HTTP_RELATIVE_PATH /auth
ENV KC_PROXY passthrough
ENV KC_CACHE_STACK kubernetes
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:21.1.1
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY keycloak-template /opt/keycloak/themes/sepl-template
COPY keycloak-template-senergy /opt/keycloak/themes/senergy-template
COPY keycloak-template-optimise /opt/keycloak/themes/optimise-template
COPY keycloak-platonam-template /opt/keycloak/themes/platonam-template
COPY keycloak-template-smartador /opt/keycloak/themes/smartador-template
COPY keycloak-template-discreet /opt/keycloak/themes/discreet-template
USER 0:0
RUN chown 1000:1000 -R /opt/keycloak/themes
USER 1000:1000
ENV KC_DB=postgres
ENV KC_FEATURES token-exchange,admin-fine-grained-authz
ENV KC_HTTP_ENABLED true
ENV KC_HOSTNAME_STRICT false
ENV KC_HTTP_RELATIVE_PATH /auth
ENV KC_PROXY passthrough
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
