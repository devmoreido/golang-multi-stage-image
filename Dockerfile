FROM golang:alpine AS builder
WORKDIR /go
COPY ./program.go .
RUN go build program.go

FROM scratch AS production
COPY --from=builder /go/program /
ENTRYPOINT ["./program"]