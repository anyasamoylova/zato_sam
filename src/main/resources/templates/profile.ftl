<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page>
    <h5>${username}</h5>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Изменить пароль</label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Изменить имя</label>
            <div class="col-sm-5">
                <input type="text" name="firstName" class="form-control"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Изменить фамилию</label>
            <div class="col-sm-5">
                <input type="text" name="lastName" class="form-control"/>
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isPainter>
            <label class="btn btn-secondary">
                <input type="radio" name="wantBeAPainter" value="yes" id="111" autocomplete="off">
                Стать художником
            </label>
        </#if>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">
                <button class="btn btn-primary" type="submit">Сохранить</button>
            </label>
        </div>
    </form>
</@c.page>
