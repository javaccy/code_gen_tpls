spring:
  application:
    name: ${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-provider
  main:
    allowBeanDefinitionOverriding: false
  sleuth:
    enabled: true
  datasource:
    driverClassName: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://127.0.0.1:3307/test?characterEncoding=utf8&serverTimezone=UTC
    username: root
    password: 123456
    type: com.zaxxer.hikari.HikariDataSource
    hikari:
      minimum-idle: 5
      maximum-pool-size: 20
      connection-test-query: SELECT 1
      connection-timeout: 30000
      max-lifetime: 1800000
      pool-name: DatebookHikariCP
      auto-commit: true
  redis:
    host: 127.0.0.1
    port: 6379
    password: 123456
    timeout: 10000
    database: 5
    ssl: false