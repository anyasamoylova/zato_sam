<#import "parts/common.ftl" as c>
<@c.page>
    <#if isPublicTracker>
        <div class="card" style="width: 40rem;">
            <img src="/img/${tracker.filename}" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">${tracker.trackerName}</h5>
                <p class="card-text">${tracker.description}</p>
                <div class="text-muted mr-1">
                    Автор:
                    <a href="/user-trackers/${tracker.author.id}">${tracker.author.firstName}</a>
                </div>
                <#if isCurrentUser>
                    <p class="mt-3">
                        <a class="mt-2" href="/edit/${tracker.id}">
                            <button type="button" class="btn btn-primary">Редактировать</button>
                        </a>
                    </p>
                </#if>
            </div>
        </div>
    </#if>
</@c.page>