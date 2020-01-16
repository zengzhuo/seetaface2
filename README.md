# Seetaface2人脸识别镜像
### ubuntu 最小java环境配置
#### 1.准备dockerfile
    FROM ubuntu:xenial-20191212
    RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    MAINTAINER zengzhuo<zhuo.zeng@sim.com>
    
    RUN apt-get update
    RUN apt-get install -y openssl
    ENV LANG C.UTF-8
    
    RUN mkdir /usr/local/jdk
    WORKDIR /usr/local/jdk
    #ADD jre1.8.0_231.tar.gz /usr/local/jdk
    # 安装openblas
    RUN mkdir -p /usr/local/openblas
    ADD openblas/lib/libopenblas.so /usr/local/openblas/lib/
    ADD /openblas/lib/libopenblas.so.0 /usr/local/openblas/lib/
    RUN ln -s /usr/local/openblas/lib/libopenblas.so /usr/lib/
    RUN ln -s /usr/local/openblas/lib/libopenblas.so.0 /usr/lib/
    # 安装protobuf
    RUN mkdir -p /usr/local/protobuf/lib/
    ADD protobuf/lib/libprotobuf.so /usr/local/protobuf/lib/
    ADD protobuf/lib/libprotobuf-lite.so.9 /usr/local/protobuf/lib/
    RUN ln -s /usr/local/protobuf/lib/libprotobuf.so /usr/lib/
    RUN ln -s /usr/local/protobuf/lib/libprotobuf.so.9 /usr/lib/
    
    ENV JAVA_HOME /usr/local/jdk/jre1.8.0_231
    ENV PATH $JAVA_HOME/bin:$PATH
    
#### 2.上传对应的库文件到服务器目录
    上传jre1.8.0_231   到../local 目录
    上传openblas       到../local 目录  
    上传protobuf       到../local 目录
    上传seetaface2     到../local 目录
#### 3. 修改jdk目录权限
    jdk下载地址：https://www.java.com/en/download/manual.jsp
    chmod -R 777 local/jre1.8.0_231
#### 4.seetaface2 的Linux/Windows依赖库下载
    链接: https://pan.baidu.com/s/1iZQrKwu2RBSLJxTgXMdDJQ 提取码: t1cu 
#### 5.最终编译目录文件
    ../jdk/jre1.8.0_231
    ../openblas
    ../protobuf
    ../dockerfile
#### 6.编译镜像、推送镜像
    docker build -t zengzhuo/seetaface2:0.0.1  .
    docker push zengzhuo/seetaface2:0.0.1
#### 7.运行容器
    运行容器，启动java程序即可
	
####  如果有问题搞不定的可以加我微信咨询
	![Image text](https://github.com/zengzhuo/seetaface2/blob/master/static/img/wx.jpg)