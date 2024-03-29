FROM alpine:latest

RUN apk add --no-cache make gcc musl-dev

WORKDIR /code/
COPY . /code/

RUN make \
  MYCFLAGS='-O3 -fomit-frame-pointer' \
  EXTRA_LIBS='-lm -ldl' \
  install

# Main entrypoint and the default command that will be run
CMD ["/usr/local/bin/lua"]

# Test the install
RUN lua -v
RUN lua /code/test/faf.lua
