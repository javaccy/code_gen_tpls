<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <groupId>com.jiaxun.tsf</groupId>
        <artifactId>tsf-simple-demo</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}</artifactId>
    <name>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}</name>
    <packaging>pom</packaging>

    <modules>
        <module>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-provider</module>
        <module>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-api</module>
    </modules>

    <properties>
        <java.version>1.8</java.version>
    </properties>

    <dependencies>
        <!-- TSF 启动器 -->
        <dependency>
            <groupId>com.tencent.tsf</groupId>
            <artifactId>spring-cloud-tsf-starter</artifactId>
        </dependency>
    </dependencies>
</project>
