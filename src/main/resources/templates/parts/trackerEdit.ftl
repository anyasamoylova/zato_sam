<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false">
    Добавить трэкер
</a>
<div class="collapse <#if tracker??>show</#if>" id="collapseExample">
    <div class ="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="trackerName" class="form-control ${(trackerNameError??)?string('is-invalid','')}"
                       value="<#if tracker??>${tracker.trackerName}</#if>"  placeholder="Введите название" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${trackerNameError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="number" name="price" class="form-control" placeholder="Введите цену"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выбирай картинку</label>
                </div>
            </div>
            <div class="form-group">
                    <label><input type="checkbox" name="isPublic"/>Видно всем</label>
            </div>
            <input type="hidden" name="id" value="<#if tracker??>${tracker.id}</#if>" />
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>