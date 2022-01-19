FROM golang:1.16-buster as basebuild
WORKDIR /harbor-adapter
COPY / /harbor-adapter
RUN make build

FROM gcr.io/distroless/base-debian10
COPY --from=basebuild /harbor-adapter/bin /harbor-adapter
CMD ["/harbor-adapter/harboradapter"]