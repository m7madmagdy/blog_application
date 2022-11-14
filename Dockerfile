FROM ruby:3.2-rc

RUN apt update --fix-missing

RUN apt install -y build-essential libpq-dev libjpeg-dev libpng-dev imagemagick nano yarn git-core curl openssl libssl-dev

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
ENV APP_PATH /app
WORKDIR $APP_PATH
ADD . $APP_PATH

RUN bundle install -j8

CMD 'bash'