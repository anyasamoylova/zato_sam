<#import "parts/common.ftl" as c>
<@c.page>
    <div class="row">
        <div class="col-sm">
            <#if author??>
                <h2>Автор: ${author}</h2>
            </#if>
            <#if name??>
                <h2>Название шаблона: ${name} </h2>
            </#if>
            <h3>Качай скорее!!!</h3>
            <div class="mt-9">
                <a href="/patternPdf/${pattern.pdfFilename}" class="btn btn-primary active" role="button" download="">Скачать</a>
                <a href="/patternPdf/${pattern.pdfFilename}" class="btn btn-secondary active" role="button" >Открыть</a>
            </div>
        </div>
        <div class="col-sm">
            <img src="../static/img/WM_8seVB62g.jpg" class="img-fluid mt-3" alt="попуг" width="400" height="400">
        </div>
    </div>
</@c.page>