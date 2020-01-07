<#--assign позволяет определять несколько переменных подряд-->
<#assign
    know = Session.SPRING_SECURITY_CONTEXT??
>

<#if know>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        isPainter = user.isPainter()
        currentUserId = user.getId()
    >
    <#else>
        <#assign
            name = ""
            isAdmin = false
            currrentUserId = -1
            isPainter = false
        >
</#if>