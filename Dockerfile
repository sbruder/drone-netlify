FROM golang:alpine as builder

RUN apk add --no-cache git upx
RUN go get -d -v github.com/netlify/netlifyctl \
    && GOOS=linux CGO_ENABLED=0 go build -v -ldflags="-s -w" -o /netlifyctl github.com/netlify/netlifyctl \
    && upx --ultra-brute /netlifyctl

FROM alpine as ca-certificates

RUN apk add --no-cache ca-certificates

FROM alpine as entrypoint

RUN apk add --no-cache gcc musl-dev
COPY entrypoint.c /entrypoint.c
RUN gcc -s -static entrypoint.c -o entrypoint

FROM scratch

COPY --from=entrypoint /entrypoint /entrypoint
COPY --from=ca-certificates /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /netlifyctl /netlifyctl

ENTRYPOINT ["/entrypoint"]
