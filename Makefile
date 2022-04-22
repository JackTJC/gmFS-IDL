java:
	mkdir -p output/java
	protoc --java_out=./output/java --proto_path=proto ./proto/*.proto

# for http_server/grpc_server
golang:
	protoc --go_out=$(GOPATH)/src/ --proto_path=proto ./proto/*.proto
# for grpc_server
go_grpc:
	protoc --go-grpc_out=$(GOPATH)/src/ ./proto/service.proto -Iproto
# for grpc_server by http
grpc_http:
	protoc --grpc-gateway_out=logtostderr=true:$(GOPATH)/src/ ./proto/service.proto -Iproto
# for whole grpc_server
go_all:
	make golang
	make go_grpc
	make grpc_http

swift:
	mkdir -p output/swift
	protoc --swift_out=./output/swift ./proto/*.proto -Iproto

javascript:
	mkdir -p output/js/{lib,gen}
	protoc --proto_path proto --js_out=import_style=commonjs,binary:output/js proto/*.proto
clean:
	rm -rf output/*
