<#macro mybatis_maps_service mybatisFindName>
    <#include "../fragment/mybatis_maps_service.ftl"/>
</#macro>
<#macro mybatis_maps_service_impl mybatisFindName>
    <#include "../fragment/mybatis_maps_service_impl.ftl"/>
</#macro>
<#macro mybatis_maps_mapper mybatisFindName>
    <#include "../fragment/mybatis_maps_mapper.ftl"/>
</#macro>
<#macro mybatis_maps_xml mybatisFindName selectPrefix selectSuffix>
    <#include "../fragment/mybatis_maps_xml.ftl"/>
</#macro>
<#macro mybatis_maps_xml_zyyx mybatisFindName selectPrefix selectSuffix>
    <#include "../fragment/mybatis_maps_xml_zyyx.ftl"/>
</#macro>
<#macro java_fields tplName>
    <#include "../fragment/fields.ftl"/>
</#macro>
