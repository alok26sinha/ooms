<%@ page import="com.cimbidia.wm.booking.BookingForecast" %>

 <tr class="prop">
        <td valign="top" class="name">
            <label for="originPort"><warehouse:message code="bookingForecast.shipFrom.label" default="Ship From" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'shipFrom', 'errors')}">
            <g:select name="shipFrom.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${bookingForecastInstance?.shipFrom?.id}"  />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="shipTo"><warehouse:message code="bookingForecast.shipTo.label" default="Ship To" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'shipTo', 'errors')}">
            <g:select name="shipTo.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${bookingForecastInstance?.shipTo?.id}"  />
        </td>
    </tr>


 <tr class="prop">
        <td valign="top" class="name">
            <label for="originPort"><warehouse:message code="bookingForecast.originPort.label" default="Origin Port" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'originPort', 'errors')}">
            <g:selectPort name="originPort.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${bookingForecastInstance?.originPort?.id}"  />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="destinationPort"><warehouse:message code="bookingForecast.destinationPort.label" default="Destination Port" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'destinationPort', 'errors')}">
            <g:selectPort name="destinationPort.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${bookingForecastInstance?.destinationPort?.id}"  />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="region"><warehouse:message code="bookingForecast.region.label" default="Region" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'region', 'errors')}">
            <g:select name="region" from="${com.cimbidia.wm.core.Region?.values()}" value="${bookingForecastInstance?.region}"  />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="forecastDate"><warehouse:message code="bookingForecast.forecastDate.label" default="Forecast Date" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'forecastDate', 'errors')}">
            <g:jqueryDatePicker name="forecastDate" precision="minute" value="${bookingForecastInstance?.forecastDate?.format('MM/dd/yyyy') }" format="MM/dd/yyyy"   />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="productClass"><warehouse:message code="bookingForecast.productClass.label" default="Product Class" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'productClass', 'errors')}">
            <g:selectPC name="productClass.id" from="${com.cimbidia.scm.constants.Constants.list()}" optionKey="id" value="${bookingForecastInstance?.productClass?.id}"  />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="equipmentType"><warehouse:message code="bookingForecast.equipmentType.label" default="Equipment Type" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'equipmentType', 'errors')}">
            <g:selectEQUIP name="equipmentType.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${bookingForecastInstance?.equipmentType?.id}"  />
        </td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="numberOfEquipments"><warehouse:message code="bookingForecast.numberOfEquipments.label" default="Number Of Equipments" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'numberOfEquipments', 'errors')}">
            <g:textField name="numberOfEquipments" value="${fieldValue(bean: bookingForecastInstance, field: 'numberOfEquipments')}" />
        </td>
    </tr>