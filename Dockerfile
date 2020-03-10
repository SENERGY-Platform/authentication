FROM jboss/keycloak:9.0.0
COPY keycloak-template /opt/jboss/keycloak/themes/sepl-template
COPY keycloak-template-senergy /opt/jboss/keycloak/themes/senergy-template
COPY keycloak-platonam-template /opt/jboss/keycloak/themes/platonam-template