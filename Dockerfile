FROM n8nio/n8n:latest

# Add PostgreSQL env variables from build args
ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD

# Add encryption key
ARG ENCRYPTION_KEY
ENV N8N_ENCRYPTION_KEY=$ENCRYPTION_KEY

# Install bash in Alpine image
USER root
RUN apk add --no-cache bash
USER node

# Runtime command using bash
CMD ["bash", "-c", "npm install -g \"$CUSTOM_NPM_GLOBAL_PACKAGES\" && n8n start"]
