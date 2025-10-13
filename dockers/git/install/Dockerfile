ARG BASED_ON="ubuntu:latest"
FROM $BASED_ON

ARG CONFIGURE_OPTIONS=""
RUN echo "Using configure options: ${CONFIGURE_OPTIONS}"
ARG VERSION=""
RUN echo "Using version ${VERSION}"

WORKDIR /working-env/git

COPY ./saved-versions/${VERSION}.tar.gz ./saved-versions/${VERSION}.tar.gz
COPY ./install.sh ./install.sh

RUN chmod +x ./install.sh
RUN ./install.sh "${VERSION}" "${CONFIGURE_OPTIONS}"

RUN rm -rf ./install.sh
RUN rm -rf ./saved-versions
