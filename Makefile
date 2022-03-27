java:
	mkdir -p output/java
	protoc --java_out=./output/java --proto_path=proto ./proto/*

golang:
	mkdir -p output/go
	protoc --go_out=${GO_PATH}/src/ --proto_path=proto ./proto/*.proto

clean:
	rm -rf output/*