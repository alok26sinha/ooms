<div id="orderItem${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='orderItems[${i}].id' value='${orderItem?.id}'/>
    <g:hiddenField name='orderItems[${i}].deleted' value='false'/>
    <g:hiddenField name='orderItems[${i}].new' value='false'/>
 
    <g:textField name='orderItems[${i}].number' value='${orderItem?.number}' />
    
 
    <span class="del-orderItem">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
</div>