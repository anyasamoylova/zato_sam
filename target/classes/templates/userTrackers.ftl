<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page>
        <#if isCurrentUser>
            <#include "parts/trackerEdit.ftl"/>
        </#if>
    <#include "parts/trackerList.ftl"/>
</@c.page>