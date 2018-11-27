# Keycloak 

## Build 
```shell
docker build -t keycloak .
```
## Run 
```shell
docker run -e KEYCLOAK_USER=<USERNAME> -e KEYCLOAK_PASSWORD=<PASSWORD> -p 8080:8080 keycloak
```
- see https://hub.docker.com/r/jboss/keycloak/

## API Endpoints
- all endpoints (OAuth, Admin): http://www.keycloak.org/docs-api/3.4/rest-api/index.htm
- /auth/realms/master/.well-known/openid-configuration - Discovery, got all relevant OAuth/OIDC endpoints
- /auth/realms/master/protocol/openid-connect/auth - Authentication Endpoint for OAuth Code Flow
- /auth/realms/master/protocol/openid-connect/token - Token Endpoint
- /auth/realms/master/protocol/openid-connect/userinfo - User Info Endpoint 

## Setup Keycloak
Done by config file
- Create client for platofrm web ui with name "frontend" 
- Create client for Auth Admin Frontend with name "auth-frontend"
- Add Redirect URI for both
- Add Web Origins for CORS 
- under "Clients - Mappers" add user role to the token, so that the tokens have the property role, important for authorization

Has to be done manually:
- Swtich the theme to sepl theme
- adjust access token lifespan
- client mqttconnector and sepl-backend should have activated "Service Account"

## Notes 
- Dockerfiles: https://github.com/jboss-dockerfiles/keycloak/tree/master/server
- Docker image: https://hub.docker.com/r/jboss/keycloak/
- keycloak-db:/var/lib/postgresql/data

title OpenID Connect - Authorization Code Flow

Resource Owner->Relying Party: nutzt Relying Party
Relying Party->Resource Owner: Redirect zum Provider
Resource Owner->Provider: Redirect zum Provider
Provider->Resource Owner: Authentifiziere Resource Owner
Resource Owner->Provider: Login und Erteilung der Berechtigung
Provider->Resource Owner: Redirect zur Relying Party + Authorization Code 
Relying Party->Provider: Authorization Code
Provider-> Relying Party: Access Token und ID Token
Relying Party->Resource: Verwendet geschützte Resource

