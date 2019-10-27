FROM ruby:2.6.4

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev libxslt-dev make gcc libc-dev nodejs tzdata" \
    HOME="/aieditor"

WORKDIR $HOME

# Counter Measure to Error:"Autoprefixer doesn't support Node v4.8.2. Update it"
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
        && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
    apt-get install -y mariadb-client lua5.1 liblua5.1-dev yarn \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://luarocks.org/releases/luarocks-3.2.1.tar.gz && \
    tar zxpf luarocks-3.2.1.tar.gz && \
    cd luarocks-3.2.1 && \
    ./configure && make && make install

RUN luarocks install penlight && \
    eval $(luarocks path --bin)

ADD Gemfile      $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock

RUN gem install bundler -v 2.0.2
RUN bundle install

ADD ./ $HOME
COPY ./ $HOME

RUN bundle exec rails yarn:install assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
