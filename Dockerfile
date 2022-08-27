FROM ruby:3.1.2
ADD . /app/
WORKDIR /app
RUN bundle install
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
EXPOSE 3000