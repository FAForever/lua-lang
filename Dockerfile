FROM alpine:latest

RUN apk add --no-cache make gcc musl-dev

WORKDIR /code/
COPY . /code/

RUN make \
  MYCFLAGS='-O3 -fomit-frame-pointer' \
  EXTRA_LIBS='-lm -ldl' \
  NUMBER='-DLUA_USER_H="\"../etc/luser_number.h"\" -DUSE_FLOAT' \
  install

# Main entrypoint and the default command that will be run
CMD ["/usr/local/bin/lua"]

# Test the install
RUN lua -v
RUN lua /code/test/faf.lua
