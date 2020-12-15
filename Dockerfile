FROM golang:1.15.2-alpine3.12 as builder
ENV NAME myapp
ENV SOURCEROOT /go/src/tusharsheth/${NAME}
COPY . ${SOURCEROOT}
WORKDIR ${SOURCEROOT}
RUN GOOS=linux go build -o bin/${NAME} main.go

FROM alpine:latest
ENV NAME myapp
ENV SOURCEROOT /go/src/tusharsheth/${NAME}
RUN apk update && apk add bash
COPY --from=builder ${SOURCEROOT}/bin/${NAME} /usr/bin
WORKDIR /usr/bin
ENV GOPATH .

CMD ["sh", "-c", "${NAME}"]
