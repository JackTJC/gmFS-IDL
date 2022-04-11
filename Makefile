SWIFT_OUT=~/Desktop/gmFS/gmFS/Proto

java:
	mkdir -p output/java
	protoc --java_out=./output/java --proto_path=proto ./proto/*.proto

golang:
	protoc --go_out=$(GOPATH)/src/ --proto_path=proto ./proto/*.proto
go_grpc:
	protoc --go-grpc_out=$(GOPATH)/src/ ./proto/service.proto -Iproto
grpc_http:
	protoc --grpc-gateway_out=logtostderr=true:$(GOPATH)/src/ ./proto/service.proto -Iproto
go_all:
	make golang
	make go_grpc
	make grpc_http

swift:
	mkdir -p output/swift
	protoc --swift_out=./output/swift ./proto/*.proto -Iproto
clean:
	rm -rf output/*
