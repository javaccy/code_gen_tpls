<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.jiaxun.tsf</groupId>
        <artifactId>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-provider</artifactId>
    <packaging>jar</packaging>

    <dependencies>
        <dependency>
            <groupId>com.jiaxun.tsf</groupId>
            <artifactId>tsf-${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-api</artifactId>
            <version>1.0-SNAPSHOT</version>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>com.jiaxun.tsf</groupId>
            <artifactId>tsf-common-provider</artifactId>
            <version>1.0-SNAPSHOT</version>
            <scope>compile</scope>
        </dependency>
    </dependencies>
</project>
