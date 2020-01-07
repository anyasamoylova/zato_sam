<#import "parts/common.ftl" as c>
<@c.page>
    <#if isCurrentUser>
    <div class ="form-group mt-3">
        <form method="post" enctype="multipart/form-data" action="/edit/${tracker.id}">
            <div class="form-group">
                <input type="text" name="trackerName" class="form-control" placeholder="Изменить название" />
            </div>
            <div class="form-group">
                <input type="text" name="description" class="form-control" placeholder="Изменить описание"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Изменить картинку</label>
                </div>
            </div>
            <div class="form-group">
                <label><input type="checkbox" name="isPublic" ${isPublic?string("checked","")}>Видно всем</label>
            </div>
            <input type="hidden" name="id" value="<#if tracker??>${tracker.id}</#if>" />
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Изменить</button>
            </div>
            <div class="form-group">
                <a href="/delete/${tracker.id}" class="mt-3">
                    <button type="button" class="btn-primary btn">Удалить</button>
                </a>
            </div>
        </form>
    </div>
        <#else>
        <div>
            Вы не имеете прав для изменения этого файла
        </div>
    </#if>
</@c.page>