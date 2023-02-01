FROM alpine:latest

ARG S6_OVERLAY_VERSION=3.1.3.0
ARG ARCH=aarch64

ENV TZ=Europe/Berlin

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${ARCH}.tar.xz /tmp
RUN apk --no-cache update && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-${ARCH}.tar.xz && \
    apk add --no-cache --update shadow bash tzdata samba-server samba-common-tools openssl && \
    rm -rf /var/cache/apk/* && \
    apk del --purge && \
    rm -rf /tmp/*

COPY --chown=root:root ./samba_s6 /

EXPOSE 137/udp 138/udp 139/tcp 445/tcp
VOLUME /config /mnt

HEALTHCHECK --interval=60s --timeout=15s \
  CMD smbclient -L \\localhost -U % -m SMB3

ENTRYPOINT ["/init"]