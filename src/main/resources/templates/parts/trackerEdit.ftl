<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false">
    Добавить трэкер
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class ="form-group mt-3">
        <form method="post" enctype="multipart/form-data" action="/user-trackers/${user.id}">
            <div class="form-group">
                <input type="text" name="trackerName" class="form-control ${(trackerNameError??)?string('is-invalid','')}"
                       placeholder="Введите название"/>
                <#if trackerNameError??>
                    <div class="invalid-feedback">
                        ${trackerNameError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" name="description" class="form-control ${(descriptionError??)?string('is-invalid','')}"
                       placeholder="Описание"/>
                <#if descriptionError??>
                    <div class="invalid-feedback">
                        ${descriptionError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выбирай картинку</label>
                </div>
            </div>
            <div class="form-group">
                    <label><input type="checkbox" name="str"/>Видно всем</label>
            </div>
<#--            <input type="hidden" name="id" value="<#if tracker??>${tracker.id}</#if>" />-->
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>