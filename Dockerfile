FROM lsiobase/alpine:3.10

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# build args
ARG DOWNURL="https://boot.netboot.xyz/ipxe"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	tftp-hpa && \
 echo "**** download netboot payloads ****" && \
 wget -O \
	/config/netboot.xyz.kpxe \
	${DOWNURL}/netboot.xyz.kpxe && \
 wget -O \
        /config/netboot.xyz.efi \
        ${DOWNURL}/netboot.xyz.efi && \
 echo "**** Permissions ****" && \
 chown -R abc:abc \
	/config

# add local files
COPY /root /
