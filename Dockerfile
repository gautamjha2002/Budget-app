FROM ruby:3.1.2
WORKDIR /app
ADD . /app/
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
EXPOSE 3000