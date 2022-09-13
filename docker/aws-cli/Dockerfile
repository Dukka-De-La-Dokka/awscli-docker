FROM python:3.9.14
ARG USERNAME=aws-iam
ARG GROUPNAME=aws-iam
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
WORKDIR /home/aws-iam
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y groff-base sudo vim less tree jq
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
    -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install
WORKDIR /home/aws-iam/workdir
