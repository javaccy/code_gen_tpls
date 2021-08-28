<#macro mybatis_maps_service mybatisFindName>
    <#include "../fragment/mybatis_maps_service.ftl"/>
</#macro>
<#macro mybatis_maps_service_impl mybatisFindName>
    <#include "../fragment/mybatis_maps_service_impl.ftl"/>
</#macro>
<#macro mybatis_maps_mapper mybatisFindName>
    <#include "../fragment/mybatis_maps_mapper.ftl"/>
</#macro>
<#macro mybatis_maps_xml mybatisFindName selectPrefix selectSuffix paramsName>
    <#include "../fragment/mybatis_maps_xml.ftl"/>
</#macro>
<#macro mybatis_plus_maps_xml mybatisFindName selectPrefix selectSuffix paramsName>
    <#include "../fragment/mybatis_plus_maps_xml.ftl"/>
</#macro>
<#macro mybatis_plus_maps_xml_simple mybatisFindName selectPrefix selectSuffix paramsName>
    <#include "../fragment/mybatis_plus_maps_xml_simple.ftl"/>
</#macro>
<#macro java_fields tplName>
    <#include "../fragment/fields.ftl"/>
</#macro>
