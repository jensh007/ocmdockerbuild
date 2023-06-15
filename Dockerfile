ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}
WORKDIR /tmp
ARG OCM_VERSION=v0.2.0
ARG OCM_PLATFORM=Linux_x86_64
RUN wget https://github.com/open-component-model/ocm/releases/download/${OCM_VERSION}/ocm_${OCM_PLATFORM}.tar.gz
RUN tar xzf ocm_${OCM_PLATFORM}.tar.gz

ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}
WORKDIR /root/
COPY --from=0 /tmp/ocm /usr/bin/ocm
