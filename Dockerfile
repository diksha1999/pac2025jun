FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:latest

RUN apk --no-cache add ca-certificates && \
    adduser -D -u 1001 appuser

WORKDIR /app
COPY --from=builder /app/main .

RUN chown appuser:appuser /app/main

USER appuser

EXPOSE 8080

CMD ["./main"]
