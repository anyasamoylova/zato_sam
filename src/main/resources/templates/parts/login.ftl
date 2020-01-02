<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин: </label>
            <div class="col-sm-5">
                <input type="text" name="username" class="form-control" placeholder="Логин"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль: </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <#if isRegisterForm>
<#--            <div class="form-group row">-->
<#--                <label class="col-sm-2 col-form-label">Password </label>-->
<#--                <div class="col-sm-5">-->
<#--                    <input type="password" name="password2" class="form-control" placeholder="Повторите пароль"/>-->
<#--                </div>-->
<#--            </div>-->
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Имя: </label>
                <div class="col-sm-5">
                    <input type="text" name="firstName" class="form-control" placeholder="Имя"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Фамилия: </label>
                <div class="col-sm-5">
                    <input type="text" name="lastName" class="form-control" placeholder="Фамилия"/>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm>
            <a href="/registration">Add new User</a>
        </#if>
        <button class="btn btn-primary" type="submit">
            <#if isRegisterForm>
            Create
            <#else>
            Sign In
            </#if>
        </button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>