<#import "parts/common.ftl" as c>
<@c.page>
    <div class="row row-cols-1 row-cols-md-3">
        <#list patterns as pattern>
            <div class="col mb-4">
                <a href="/pattern/${pattern.id}">
                    <div class="card h-100">
                        <#if pattern.imgFilename??>
                            <img src="/patternImg/${pattern.imgFilename}" class="card-img-top">
                        </#if>
                        <div class="card-body">
                            <#--                <a href="/pattern/${pattern.id}">-->
                            <h5 class="card-title">${pattern.name}</h5>
                        </div>
                        <div class="card-footer text-muted">
                            ${pattern.description}
                        </div>
                    </div>
                </a>
            </div>
        <#else>
            Шаблонов нет
        </#list>
    </div>
</@c.page>