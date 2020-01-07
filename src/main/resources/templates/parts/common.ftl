<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Зато сам</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../static/css/bootstrap.css">
    </head>
    <body>
        <#include "navbar.ftl">
        <div class="container mt-5">
        <#nested>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="../../static/js/jquery-3.2.1.slim.min.js"></script>
        <script src="../../static/js/popper.min.js"></script>
        <script src="../../static/js/bootstrap.js"></script>
    </body>
    </html>
</#macro>