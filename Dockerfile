FROM alpine:3.6
RUN set -x \
      && apk update \
      && apk add curl bash jq \
      && rm -rf /var/cache/apk/*

COPY cancel-redundant-builds /bin/
CMD ["/bin/cancel-redundant-builds", "--force"]
