FROM golang:latest

WORKDIR /src/github.com/arcrose/patches/

ENV GOPATH /

COPY cmd/ cmd/
COPY internal/ internal/
COPY pkg/ pkg/
COPY patches.go patches.go
COPY Makefile Makefile

RUN make install-dependencies
#RUN make unit-test
RUN make build-server

CMD ["./patches-server", "-clair", "http://clair:6060"]
