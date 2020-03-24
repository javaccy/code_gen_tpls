<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.jiaxun.tsf</groupId>
        <artifactId>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-api</artifactId>
    <packaging>jar</packaging>
    <dependencies>
        <dependency>
            <groupId>com.jiaxun.tsf</groupId>
            <artifactId>tsf-common</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
        <!-- TSF 启动器 -->
        <dependency>
            <groupId>com.tencent.tsf</groupId>
            <artifactId>spring-cloud-tsf-starter</artifactId>
        </dependency>
    </dependencies>
</project>
