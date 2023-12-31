ARG ALPINE_VERSION=latest
ARG OCM_VERSION=v0.3.0
ARG OCM_PLATFORM=linux-amd64

FROM alpine:${ALPINE_VERSION}
ARG ALPINE_VERSION
ARG OCM_VERSION
ARG OCM_PLATFORM
WORKDIR /tmp
RUN echo OCM_VERSION: ${OCM_VERSION}, OCM_PLATFORM: ${OCM_PLATFORM}
RUN wget https://github.com/open-component-model/ocm/releases/download/v${OCM_VERSION}/ocm-${OCM_VERSION}-${OCM_PLATFORM}.tar.gz
RUN tar xzf ocm-${OCM_VERSION}-${OCM_PLATFORM}.tar.gz

FROM alpine:${ALPINE_VERSION}
ARG ALPINE_VERSION
ARG OCM_VERSION
ARG OCM_PLATFORM
WORKDIR /root/
COPY --from=0 /tmp/ocm /usr/bin/ocm
LABEL org.opencontainers.image.description Open Component Model Client ${OCM_VERSION} based on Alpine ${ALPINE_VERSION}
