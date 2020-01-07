<#import "parts/common.ftl" as c>
<@c.page>
    <form class="mb-2" method="post" action="/user/delete">
        <p>Вы уверены, что хотите удалить пользователя
            <b>${user.username}</b> ?</p>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Да</button>
    </form>
    <a class="mt-4" href="/user"><button class="btn btn-primary">Нет</button></a>
</@c.page>