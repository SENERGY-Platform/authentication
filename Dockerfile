FROM jboss/keycloak:15.0.2
COPY keycloak-template /opt/jboss/keycloak/themes/sepl-template
COPY keycloak-template-senergy /opt/jboss/keycloak/themes/senergy-template
COPY keycloak-platonam-template /opt/jboss/keycloak/themes/platonam-template
USER 0:0
RUN chown 1000:1000 -R /opt/jboss/keycloak/themes
USER 1000:1000
