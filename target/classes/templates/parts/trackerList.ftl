<div class="card-desk">
    <#list trackers as tracker>
        <div class="card">
            <#if tracker.filename??>
                <img src="/img/${tracker.filename}" class="card-img-top">
            </#if>
            <div class="card-body">
                <h5 class="card-title">${tracker.trackerName}</h5>
                <#if tracker.price??>
                <span>${tracker.price}</span>
                </#if>
                <a href="/like/${tracker.id}">
                    <#if tracker.hasLike(user)>
                        <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                    </#if>
                </a>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-trackers/${tracker.author.id}">${tracker.author.firstName}</a>
            </div>
        </div>
    <#else>
        No trackers
    </#list>
</div>