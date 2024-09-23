FROM golang:1.23
WORKDIR /app
COPY go.mod ./
#COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /server
CMD ["/server"]
