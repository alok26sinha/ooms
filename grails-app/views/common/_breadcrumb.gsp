
<ol class="breadcrumb clear" style="padding: 10px 5px; margin-bottom: 4px">
    <li>
        <g:link controller="dashboard" action="index">
        <i class="fa fa-leaf"></i>
        </g:link>
    </li>
    <g:if test="${session?.user && session?.warehouse}">
        <li>
            <a href="javascript:void(0);" class="warehouse-switch">
                ${session?.warehouse?.name }
            </a>
        </li>
    </g:if>
    <g:if test="${controllerName }">
        <li >
            <g:link class="text-success" controller="${controllerName }" action="index">
                <strong><warehouse:message code="${controllerName + '.label'}" /><strong>	
            </g:link>
        </li>
    </g:if>
<%--
<g:if test="${actionName }">
    <li>
        <a href="">
            ${actionName.capitalize() }
        </a>
    </li>
</g:if>
--%>
    <g:if test="${g.layoutTitle() && !actionName.equals('index') && !actionName.equals('list') }">
        <li class="active">
            <a href="#">${g.layoutTitle()}</a>
        </li>
    </g:if>

</ol>


