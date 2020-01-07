<#include "security.ftl">
<#import "login.ftl" as l>
<#--Панель навигации > lg отображается в развернутом виде-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<#--    в свернутом виде:-->
    <a class="navbar-brand" href="/">
        Зато сам
        <img src="../../static/img/bird.png" height="50">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
<#--        автоматически генерируемое меню-->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">На главную</a>
            </li>
            <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="/main">Трэкеры</a>
            </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="/pattern">Шаблоны</a>
            </li>

            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователей</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Профиль</a>
                </li>
                </#if>
            <#if isPainter>
                <li class="nav-item">
                    <a class="nav-link" href="/user-trackers/${currentUserId}">Мои трэкеры</a>
                </li>
            </#if>
        </ul>
<#--        Вид блока в навигационной панели-->
        <div class="navbar-text mr-3">
            ${name}
        </div>
        <#if user??>
        <@l.logout/>
        <#else>
        <form action="/login" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit">
                Sign In
            </button>
        </form>
        </#if>
    </div>
</nav>
