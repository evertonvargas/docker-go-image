FROM golang:alpine as build
WORKDIR /src
COPY main.go .
RUN go build -o /app ./main.go

FROM scratch
COPY --from=build /app /bin
CMD ["/bin"]