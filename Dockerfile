FROM registry.access.redhat.com/ubi8/ubi:8.1
MAINTAINER daniel@foldingbeauty.nl
ARG CODE_SERVER_VERSION=3.0.0
ARG GOLANG_VERSION=1.14
# install VSCode
RUN curl -L https://github.com/cdr/code-server/releases/download/"$CODE_SERVER_VERSION"/code-server-"$CODE_SERVER_VERSION"-linux-x86_64.tar.gz | tar -xz  -C /opt/
# install Golang
RUN curl -L https://dl.google.com/go/go"$GOLANG_VERSION".linux-amd64.tar.gz | tar -xz -C /usr/bin
# install Git
RUN yum install -y git
ENV PATH "$PATH:/usr/bin/go/bin"
ENV GOPATH /home/coder/go

RUN adduser -u 1000 coder
USER coder

# All go packages needed for the VSCode GO Extensions
RUN go get -v github.com/mdempsky/gocode 
RUN go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs 
RUN go get -v github.com/ramya-rao-a/go-outline 
RUN go get -v github.com/acroca/go-symbols 
RUN go get -v golang.org/x/tools/cmd/guru 
RUN go get -v golang.org/x/tools/cmd/gorename 
RUN go get -v github.com/cweill/gotests
RUN go get -v github.com/fatih/gomodifytags 
RUN go get -v github.com/josharian/impl 
RUN go get -v github.com/davidrjenni/reftools/cmd/fillstruct 
RUN go get -v github.com/haya14busa/goplay/cmd/goplay 
RUN go get -v github.com/godoctor/godoctor 
RUN go get -v github.com/go-delve/delve/cmd/dlv
RUN go get -v github.com/stamblerre/gocode
RUN go get -v github.com/rogpeppe/godef
RUN go get -v github.com/sqs/goreturns
RUN go get -v golang.org/x/lint/golint


ENV EXTENSIONS_DIR=/home/coder/.local/share/code-server/extensions
WORKDIR /opt/code-server-"$CODE_SERVER_VERSION"-linux-x86_64
RUN ./code-server --install-extension redhat.vscode-yaml
RUN ./code-server --install-extension ms-vscode.go
RUN ./code-server --install-extension ipedrazas.kubernetes-snippets
RUN ./code-server --install-extension stevejpurves.cucumber

CMD ./code-server --host 0.0.0.0 --auth none
