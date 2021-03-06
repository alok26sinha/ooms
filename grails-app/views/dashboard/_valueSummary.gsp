
<div class="boostrap">
<div class="panel panel-primary">
	
	<div class="panel-heading panel-primary">
        <h5><warehouse:message code="inventory.value.label" default="Stock value"/></h5>
    </div>
    <div class="widget-content" style="padding:0; margin:0">
        <div id="alertSummary">

            <table class="zebra">
                <tbody>
                    <tr>
                        <td class="center" style="width: 1%">
                            <img src="${createLinkTo(dir:'images/icons/silk/money.png')}" class="middle"/>
                        </td>
                        <td>
                            <warehouse:message code="inventory.totalStockValue.label" default="Total value of all stock"/>
                        </td>
                        <td class="right">
                            <div id="totalStockValue"><img class="spinner" src="${createLinkTo(dir:'images/spinner.gif')}" class="middle"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="${createLinkTo(dir:'images/icons/silk/sum.png')}" class="middle"/>
                        </td>
                        <td>
                            <div>Percentage of products with pricing information</div>
                        </td>
                        <td>
                            <div id="progressPercentage" class="right"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div id="progressbar"></div>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="odd">
                        <td colspan="3">
                            <span id="totalStockSummary" class="fade"></span>
                        </td>
                    </tr>

                </tfoot>
            </table>
        </div>
    </div>
</div>
</div>
