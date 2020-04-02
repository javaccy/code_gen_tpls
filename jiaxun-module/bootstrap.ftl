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
  cloud:
    consul:
      port: 8500
      host: 192.168.10.6
  profiles:
    active: dev
  freemarker:
    cache: false
    charset: utf-8
    check-template-location: true
    content-type: text/html
    expose-request-attributes: true
    expose-session-attributes: true
    request-context-attribute: request
  mvc:
    static-path-pattern: /static/**
mybatis-plus:
  mapper-locations: classpath*:com/jiaxun/**/mapper/*.xml
  type-aliases-package: com.jiaxun.**.model
  configuration:
    map-underscore-to-camel-case: true #开启驼峰
    cache-enabled: true #配置的缓存的全局开关
    call-setters-on-nulls: true # 返回map是空字段也返回
    lazy-loading-enabled: true
    multiple-result-sets-enabled: true
    default-fetch-size: 5
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
  global-config:
    db-config:
      logic-delete-value: 1
      logic-not-delete-value: 0