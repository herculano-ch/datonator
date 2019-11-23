FROM elixir:1.9
MAINTAINER herculano.chaves
RUN apt-get update && apt-get install --yes mysql-client
ADD . /app
RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
WORKDIR /app
EXPOSE 4000
CMD ["./run.sh"]