FROM docker/compose:1.29.2

ENV SWARM_CLIENT_VERSION="3.27" \
    COMMAND_OPTIONS="" \
    USER_NAME_SECRET="" \
    PASSWORD_SECRET=""

RUN adduser -G root -D jenkins && \
    apk --update --no-cache add openjdk8-jre python3 py3-pip git git-lfs openssh ca-certificates openssl && \
    wget -q https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar -P /home/jenkins/

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]


# RUN apk update && \
#     apk add --no-cache docker-cli python3 && \
#     apk add --no-cache --virtual .docker-compose-deps python3-dev libffi-dev openssl-dev gcc libc-dev make && \
#     pip3 install docker-compose && \
#     apk del .docker-compose-deps
