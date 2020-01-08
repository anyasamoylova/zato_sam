<div class="card-columns mt-3">
    <#list trackers as tracker>
        <div class="col">
            <div class="card h-100">
                <#if tracker.filename??>
                    <img src="/img/${tracker.filename}" class="card-img-top">
                </#if>
                <div class="card-body">
                    <a href="/tracker/${tracker.id}">
                        <h5 class="card-title">${tracker.trackerName}</h5>
                    </a>
                    <#if tracker.description??>
                        <p class="card-text">${tracker.description}</p>
                    </#if>
                </div>
                <div class="card-footer text-muted">
                    <a href="/user-trackers/${tracker.author.id}">${tracker.author.firstName}</a>
                </div>
            </div>
        </div>
    <#else>
        No trackers
    </#list>
</div>