# graduate-design-idl

> 推荐vs code+vs code proto3插件打开本项目

---

# 简介

以[Protobuf](https://developers.google.com/protocol-buffers)为基础定义的IDL（Interface Description Language）,及其方便的生成代码，不需要繁琐的文档定义和json结构体编写。一次编写，多语言(C++,Java,Go,Objective-C)通用。

- [简介](https://developers.google.com/protocol-buffers/docs/overview)
- [语法](https://developers.google.com/protocol-buffers/docs/proto3)

# 项目结构

```bash
./proto
├── common.proto # 一些公共的数据结构定义
├── create_dir.proto # 创建文件夹接口
├── delete_file.proto # 删除文件接口
├── get_node.proto # 获取文件节点接口
├── get_recv_file.proto # 获取已收到的文件接口
├── google/ # 类似于头文件，不用关心
├── ping.proto # ping接口，测试连通性使用的
├── register_file.proto # 注册文件接口
├── search_file.proto # 搜索文件接口
├── service.proto # uri定义接口
├── share_file.proto # 分享文件接口
├── upload_file.proto # 上传文件接口
├── user_login.proto # 用户登录接口
└── user_register.proto # 用户注册接口
```



# 使用

## protoc安装

- linux

  ```bash
  apt install -y protobuf-compiler
  protoc --version
  ```
  
- macos

  1. 安装brew

     https://brew.sh/

  2. 安装protoc

     ```bash
     brew install protobuf
     ```

- Windows

  后续补充

## 代码生成

- java

  ```bash
  make java
  ```

  更详细的[参考手册](https://developers.google.com/protocol-buffers/docs/javatutorial)

- go

  请确保`$GOPATH/src`下已经有此目录

  ```protobuf
  option go_package = "github.com/JackTJC/gmFS_backend/pb_gen";
  ```

  然后

  ```bash
  make golang
  ```

- swift

  首先安装`swift-protobuf`

  ```bash
  brew install swift-protobuf
  ```

  再生成代码

  ```bash
  make swift
  ```

## 代码使用

### java

1. 复制代码

代码生成后可以看见`output/java`中生成了`com.graduate.design`包，将整个包复制到`java`工程的源码目录中,即

```bash
${PROJECT_DIR}/src/main/java # 以自身项目结构为准
```

2. `pom.xml`添加依赖

   ```xml
           <!-- https://mvnrepository.com/artifact/com.google.protobuf/protobuf-java-util -->
           <dependency>
               <groupId>com.google.protobuf</groupId>
               <artifactId>protobuf-java-util</artifactId>
               <version>3.19.4</version>
           </dependency>
   
           <!-- https://mvnrepository.com/artifact/com.google.cloud/google-cloud-pubsub -->
           <dependency>
               <groupId>com.google.cloud</groupId>
               <artifactId>google-cloud-pubsub</artifactId>
               <version>1.114.7</version>
           </dependency>
   ```

   

3. `jsonFormat`实例

   ```java
   import com.google.protobuf.util.JsonFormat;
   import com.graduate.design.Common;
   import com.graduate.design.CreateDir;
   
   
   public class App {
       public static void main(String[] args) {
           CreateDir.CreateDirRequest req = CreateDir.CreateDirRequest
                   .newBuilder()
                   .setDirName("file name")
                   .setParentId(111)
                   .build();
           Common.Node node = Common.Node
                   .newBuilder()
                   .setCreateTime(123)
                   .setNodeName("123")
                   .setNodeId(1)
                   .setNodeType(Common.NodeType.Dir)
                   .build();
           try {
               System.out.println(JsonFormat.printer().print(req));
               System.out.println(JsonFormat.printer().print(node));
           }catch (Exception ignored){
               System.out.println(ignored);
           }
   
       }
   }
   ```

4. 输出结果

   ```json
   {
     "dirName": "file name",
     "parentId": "111"
   }
   {
     "nodeType": "Dir",
     "nodeId": "1",
     "nodeName": "123",
     "createTime": "123"
   }
   ```

### golang（服务端使用）

代码直接生成到目录，可以无需关心这里

### swift（IOS端使用）

类似`java`将`output/swift`中文件批量导入XCode工程即可，另外需要在工具栏`File->Add Package...`添加`SwiftProtobuf`包



