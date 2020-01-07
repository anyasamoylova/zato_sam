<#import "parts/common.ftl" as c>
<@c.page>
    <h2>Список пользователей</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Роль</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td scope="col">${user.username}</td>
                <td scope="col"><#list user.roles as role>${role}<#sep>, </#list></td>
                <td scope="col"><a href="/user/${user.id}">Редактировать</a></td>
                <td scope="col"><a href="/user/delete/${user.id}">Удалить</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>