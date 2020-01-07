<#import "parts/common.ftl" as c>
<@c.page>
    <form class="mb-2" method="post" action="/delete">
        <p>Вы уверены, что хотите удалить трекер
            <b>${tracker.trackerName}</b> ?</p>
        <input type="hidden" value="${tracker.id}" name="trackerId">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Да</button>
    </form>
    <a class="mt-4" href="/edit/${tracker.id}"><button class="btn btn-primary">Нет</button></a>
</@c.page>