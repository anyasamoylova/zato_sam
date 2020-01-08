<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин: </label>
            <div class="col-sm-5">
                <label>
                    <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid','')}"
                           placeholder="Логин"/>
                    <#if usernameError??>
                        <div class="invalid-feedback">
                            ${usernameError}
                        </div>
                    </#if>
                </label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль: </label>
            <div class="col-sm-5">
                <label>
                    <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid','')}"
                           placeholder="Пароль"/>
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </#if>
                </label>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Повторите пароль: </label>
                <div class="col-sm-5">
                    <label>
                    <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid','')}"
                           placeholder="Повторите пароль"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                    </label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Имя: </label>
                <div class="col-sm-5">
                    <label>
                        <input type="text" name="firstName" class="form-control" placeholder="Имя">
                    </label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Фамилия: </label>
                <div class="col-sm-5">
                    <label>
                        <input type="text" name="lastName" class="form-control" placeholder="Фамилия">
                    </label>
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
        <button class="btn btn-primary" type="submit">
                Sign Out
        </button>
    </form>
</#macro>