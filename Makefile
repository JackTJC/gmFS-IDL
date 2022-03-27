java:
	mkdir -p output/java
	protoc --java_out=./output/java --proto_path=proto ./proto/*

golang:
	protoc --go_out=$(GOPATH)/src/ --proto_path=proto ./proto/*.proto

go_grpc:
	protoc --go-grpc_out=$(GOPATH)/src/ ./proto/service.proto -Iproto

clean:
	rm -rf output/*
