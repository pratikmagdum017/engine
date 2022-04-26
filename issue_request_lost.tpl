<%assign var=is_consumable_available value=0%>
<%assign var=is_non_consumable_available value=0%>
<%foreach from=$get_issue_request_process_detail key=key item=value%>
            <%if $value['e_nature'] eq 'Consumable'%>
                <%assign var=is_consumable_available value=1%>
            <%/if%>
            
            <%if $value['e_nature'] eq 'NonConsumable'%>
                <%assign var=is_non_consumable_available value=1%>
            <%/if%>
<%/foreach%>

<div class="details" height="100" colspan="6" align="left" bgcolor="#ebebeb" >
                <font class="row_data" style="font-size: 22px;border-bottom: solid 2px #ffcb05;display: inline;
      padding-bottom: 3px;">
                <strong><%$this->lang->line('GENERIC_RETURNED_DETAILS')%></strong>
                </font>
</div>
  <br>      
<%if $is_consumable_available eq 1%>
<table style="background:#ebebeb;border-collapse: collapse;" width="100%" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr>
            <td colspan="6" align="center" height="50">
             <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
            <strong><%$this->lang->line('GENERIC_CONSUMABLE_ITEM')%></strong>
            </font>
                 
             </td>
        </tr>
        <tr>
            <td width="10%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_SR_NO')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('PRODUCTS_PRODUCT_IMAGE')%></strong>
                </font>
            </td>
            <td width="40%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_PRODUCT_NAME')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_ITEM_BATCH_NUMBER')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_TOTAL_QUANTITY')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_EMAIL_CONDITION')%></strong>
                </font>
            </td>
        </tr>
        <%if $get_issue_request_process_detail|@is_array && $get_issue_request_process_detail|@count gt 0%>
            <%assign var=i value=1%>
            <%foreach from=$get_issue_request_process_detail key=key item=val%>
             <%if $val['e_nature'] eq 'Consumable'%>
             <%if $val['condition'] eq 'Lost'%>
            <tr>
                <td width="10%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                    <%$i++%>
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                    <%if $val['item_image'] neq ''%>
                        <img alt="<%$val['product_name']%>" src="<%$val['item_image']%>" width="42px" height="42px" style="vertical-align: middle;" /> 
                    <%else%>
                        <img alt="<%$val['product_name']%>" src="<%$this->general->getProductImageURL()%>" width="42px" height="42px" style="vertical-align: middle;" /> 
                    <%/if%>    
                    </font>
                </td>
                <td width="40%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                    <%$val['product_name']%> <br/> (<%$val['item_short_name']%> / <%$val['product_code']%>)
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222"><%$val['batch_number']%>
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222"><%$val['total_quantity']%>
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222"><%$val['condition']%>
                    </font>
                </td>
            </tr>
            
            <%/if%>
            <%/if%>
        <%/foreach%>
        <%else%>
          <tr> <td colspan="4" align="center" height="50"> <%$this->lang->line('GENERIC_NO_DATA_FOUND')%></td> </tr>
        <%/if%>
        
</tbody>
</table>
<%/if%>
<br><br>
<%if $is_non_consumable_available eq 1%>
<table style="background:#ebebeb;border-collapse: collapse;" width="100%" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr>
            <td colspan="6" align="center" height="50"> 
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
            <strong> <%$this->lang->line('GENERIC_NON_CONSUMABLE_ITEM')%></strong>
            </font>
                    
                </td>
        </tr>
        <tr>
            <td width="10%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_SR_NO')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_EMAIL_PRODUCT_IMAGE')%></strong>
                </font>
            </td>
            <td width="40%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_EMAIL_PRODUCT_NAME')%></strong>
                </font>
            </td>
            <td width="40%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_QR_CODE_INBOUND_NEW')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_ITEM_BATCH_NUMBER')%></strong>
                </font>
            </td>
            <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                <strong><%$this->lang->line('GENERIC_EMAIL_CONDITION')%></strong>
                </font>
            </td>
            
        </tr>
        <%if $get_issue_request_process_detail|@is_array && $get_issue_request_process_detail|@count gt 0%>
        <%assign var=j value=1%>
        <%foreach from=$get_issue_request_process_detail key=key item=val%>
            <%if $val['e_nature'] eq 'NonConsumable'%>
            <%if $val['condition'] eq 'Lost'%>
            <tr>
                <td width="10%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                    <%$j++%>
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                    <%if $val['product_image'] neq ''%>
                        <img alt="<%$val['product_name']%>" src="<%$val['product_image']%>" width="42px" height="42px" style="vertical-align: middle;" /> 
                    <%else%>
                        <img alt="<%$val['product_name']%>" src="<%$this->general->getProductImageURL()%>" width="42px" height="42px" style="vertical-align: middle;" /> 
                    <%/if%>    
                    </font>
                </td>
                <td width="40%" height="50" align="center" bgcolor="#e2e1e1" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222">
                    <%$val['product_name']%> <br/> (<%$val['item_short_name']%> / <%$val['product_code']%>)
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222"><%$val['serial_number']%>
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222"><%$val['batch_number']%>
                    </font>
                </td>
                <td width="25%" height="50" align="center" bgcolor="#e2e1e1" class="td" style="border: 1px solid #d6d3d3;">
                    <font class="row_data" face="Verdana, Geneva, sans-serif" color="#222222"><%$val['condition']%>
                    </font>
                </td>
            </tr>
            <%/if%>
            <%/if%>
        <%/foreach%>
        <%else%>
          <tr> <td colspan="6" align="center" height="50"> <%$this->lang->line('GENERIC_NO_DATA_FOUND')%></td> </tr>
        <%/if%>
        
</tbody>
</table>
<%/if%>

