FROM centos:7 as builder

RUN yum --enablerepo=extras install -y epel-release && \
    yum install -y wget python2 python-pip nodejs ShellCheck && \
    pip install yamllint && \
    npm install -g npx prettier@1.17.0 markdownlint-cli@0.13.0 tslint@5.12.1 typescript@3.2.4 && \
    wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz && \
    tar xf kubeval-linux-amd64.tar.gz && \
    cp kubeval /usr/local/bin

FROM alpine

COPY --from=builder . .

WORKDIR /usr/src/app

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]