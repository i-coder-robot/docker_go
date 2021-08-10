FROM golang:1.16-alpine
MAINTAINER Happy
#WORKDIR /go/src/docker_go
#COPY . .
#RUN go get -d -v ./...
#RUN go install -v ./...
#
#CMD ["docker_go"]
WORKDIR /docker_go
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o docker_go .
EXPOSE 8080
CMD ["./docker_go"]