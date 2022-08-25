FROM ruby:3.1.2
RUN apt update && apt -y install nodejs
WORKDIR /app

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
