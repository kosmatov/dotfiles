FROM alpine:latest 

RUN apk add bash git ninja gcc g++ linux-headers && \
  git clone https://github.com/LuaLS/lua-language-server /app && \
  cd /app && \
  ./make.sh || true && \
  sed "s:#include <limits>:#include <limits>\n#include <cstring>:" 3rd/bee.lua/bee/net/endpoint.cpp > endpoint.cpp && \
  cp endpoint.cpp 3rd/bee.lua/bee/net/ && \
  cp endpoint.cpp 3rd/luamake/bee.lua/bee/net/ && \
  ./make.sh

CMD ["/app/bin/lua-language-server"]
