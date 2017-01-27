<div>
	<table style="width:auto;">
		<tr>
			<td class="middle" width="1%">
				<g:render template="actions"/>
            </td>
            <td class="middle">
				<span class="title">
                    <g:if test="${locationInstance?.id}">
                        ${fieldValue(bean: locationInstance, field: "name")}
                    </g:if>
                    <g:else>
                        ${warehouse.message(code:'equipment.show.label', default: "Show Equipment")}

                    </g:else>
				</span>
			</td>
			<td class="right">
				<div class="right">
                </div>

			
			</td>
		</tr>
	</table>
</div>