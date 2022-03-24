# graduate-design-idl

> 推荐vs code+vs code proto3插件

---

## 简介

以[Protobuf](https://developers.google.com/protocol-buffers)为基础定义的IDL（Interface Description Language）,及其方便的生成代码，不需要繁琐的文档定义和json结构体编写。一次编写，多语言(C++,Java,Go,Objective-C)通用。

- [简介](https://developers.google.com/protocol-buffers/docs/overview)
- [语法](https://developers.google.com/protocol-buffers/docs/proto3)

## 使用

### protoc安装

- linux&macos

  1. 安装brew

     https://brew.sh/

  2. 安装protoc

     ```bash
     brew install protobuf
     ```

- Windows

  后续补充

### 代码生成

- java

  ```bash
  make java
  ```

  更详细的[参考手册](https://developers.google.com/protocol-buffers/docs/javatutorial)

- go

- objective-c