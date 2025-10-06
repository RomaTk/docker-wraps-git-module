ARG BASED_ON="ubuntu:latest"
FROM $BASED_ON

WORKDIR /working-env/git

VOLUME [ "/working-env/git/configs" ]

COPY ./main.sh ./main.sh
RUN chmod +x ./main.sh