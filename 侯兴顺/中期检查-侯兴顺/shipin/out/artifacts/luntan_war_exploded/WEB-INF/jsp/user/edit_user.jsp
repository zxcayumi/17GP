<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<base href="${config:url(pageContext.request)}">
<TITLE>修改用户</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="backstage/css/list.css" type="text/css" rel="stylesheet">
<LINK href="backstage/css/table.css" type="text/css" rel="stylesheet">
<script language="javascript" type="text/javascript">


function sureSubmit(objForm){
	//按钮设置 disabled="disabled"
	document.getElementById("submitForm").disabled=true;
	objForm.submit();
} 
</script>
  
</HEAD>
<BODY>
<!-- IE6 会弹出'已终止操作'错误，本JS要放在Body标签下面 -->
<script type="text/javascript" src="backstage/lhgcalendar/lhgcore.lhgcalendar.min.js" language="javascript" ></script>
<form:form modelAttribute="user" method="post" autocomplete="off">
<input type="hidden" name="userVersion" value="${user.userVersion}">
<DIV class="d-box">
<div class="d-button">

<c:if test="${param.jumpStatus == null || param.jumpStatus == '' || param.jumpStatus >0}">
	<input class="functionButton" type="button" onClick="javascript:window.location.href='${config:url(pageContext.request)}control/user/list${config:suffix()}?queryState=${param.queryState}&page=${param.userPage}'" value="返回">
</c:if>
</div>


<TABLE class="t-table" cellSpacing="1" cellPadding="2" width="100%" border="0">
	<TBODY>
	<TR>
	    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>会员用户名：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	${user.userName }
	    </TD>
    </TR>
    <TR>
	    <TD class="t-label t-label-h" width="12%">呢称：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<input class="form-text" name="nickname" size="50" maxlength="60" value="${user.nickname}"/>
	    	&nbsp;&nbsp;<span class="span-text">${error['nickname']}</span>
	    </TD>
    </TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>密码：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
		    <input type="password" class="form-text" name="password" size="30" maxlength="30" value="${user.password }"/>
		    &nbsp;&nbsp;<span class="span-text">${error['password']}</span>
		    <SPAN class="span-help">不修改请留空</SPAN>
		</TD>
	</TR>

	<TR>
	    <TD class="t-label t-label-h" width="12%">Email地址：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<input class="form-text" name="email" size="50" maxlength="60" value="${user.email}"/>
	    	&nbsp;&nbsp;<span class="span-text">${error['email']}</span>
	    </TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>密码提示问题：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<input class="form-text" name="issue" size="50" maxlength="40" value="${user.issue}"/>
	    	&nbsp;&nbsp;<span class="span-text">${error['issue']}</span>
	    </TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%"><SPAN class="span-text">*</SPAN>密码提示答案：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<input class="form-text" name="answer" size="50" maxlength="40" value="${user.answer}"/>
	    	&nbsp;&nbsp;<span class="span-text">${error['answer']}</span>
	    	<SPAN class="span-help">不修改请留空</SPAN>
	    </TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%">手机：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<input class="form-text" name="mobile" size="50" maxlength="60" value="${user.mobile}"/>
	    	&nbsp;&nbsp;<span class="span-text">${error['mobile']}</span>
    	</TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%">实名认证：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
			<label><INPUT type="radio" value="true" name="realNameAuthentication" <c:if test="${ user.realNameAuthentication == true}">checked="checked"</c:if>>已实名</label>
			<label><INPUT type="radio" value="false" name="realNameAuthentication" <c:if test="${ user.realNameAuthentication == false}">checked="checked"</c:if> >未实名</label>
	    
	    </TD>
	</TR>
  
	<TR>
	    <TD class="t-label t-label-h" width="12%">用户状态：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
			<label><INPUT type="radio" value="1" name="state" <c:if test="${ user.state eq 1 || user.state eq 11}">checked="checked"</c:if>>正常用户</label>
			<label><INPUT type="radio" value="2" name="state" <c:if test="${ user.state eq 2 || user.state eq 12}">checked="checked"</c:if> >禁止用户</label>
	    
	    </TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%">显示用户动态：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<label><INPUT type="radio" value="true" name="allowUserDynamic" <c:if test="${ user.allowUserDynamic == true}">checked="checked"</c:if>>显示</label>
			<label><INPUT type="radio" value="false" name="allowUserDynamic" <c:if test="${ user.allowUserDynamic == false}">checked="checked"</c:if> >关闭</label>
	    
	    </TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%">用户角色：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
		    <table cellSpacing="0" cellPadding="0" width="100%" border="0">
			    <c:forEach items="${userRoleList}" var="entry" > 
				    <tr>
				  		<td style="border-bottom:1px dashed #BFE3FF; line-height:30px;color: #999; text-align:left;width: 200px;">
				  			<label style="line-height: 28px;margin-right: 8px;"><input type="checkbox" name="userRolesId" value="${entry.id}" <c:if test="${entry.defaultRole}">disabled="disabled"</c:if> <c:if test="${entry.selected}">checked="checked"</c:if>/>${entry.name}<c:if test="${entry.defaultRole}">(默认角色)</c:if></label>
				    	</td>
				    	<td style="border-bottom:1px dashed #BFE3FF; line-height:30px;color: #999; text-align:left;">
				    		<c:if test="${!entry.defaultRole}">
					    		<input id="validPeriodEnd_${entry.id}" name="validPeriodEnd_${entry.id}" class="date-input" type="text" size="25" placeholder="有效期" value="<fmt:formatDate value="${entry.validPeriodEnd}"  pattern="yyyy-MM-dd HH:mm"/>">
								<c:set value="validPeriodEnd_${entry.id}" var="validPeriodEnd_error"></c:set>
								<span class="span-text" >${error[validPeriodEnd_error]}</span>
							</c:if> 
				    	</td>
				    </tr>
				</c:forEach>
		    </table>
	    </TD>
	</TR>
	<TR>
	    <TD class="t-label t-label-h" width="12%">备注：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
	    	<textarea class="form-textarea" name="remarks" cols="80" rows="5" >${user.remarks }</textarea>
	    </TD>
	</TR>
	<!-- 用户自定义注册功能项 -->
	<c:forEach items="${userCustomList}" var="entry" varStatus="status">
		<TR>
	    <TD class="t-label t-label-h" width="12%"><c:if test="${entry.required == true}"><SPAN class="span-text">*</SPAN></c:if>${entry.name}：</TD>
	    <TD class="t-content" width="88%" colSpan="3">
			<c:if test="${entry.chooseType ==1}">
				<input type="text" class="form-text" name="userCustom_${entry.id}" value="<c:forEach items='${entry.userInputValueList}' var='userInputValue'>${userInputValue.content}</c:forEach>" size="${entry.size}" maxlength="${entry.maxlength}">
				<SPAN class="span-help">${entry.tip}</SPAN>
			</c:if>
			<c:if test="${entry.chooseType ==2}">
				
				<c:forEach items="${entry.itemValue}" var="itemValue" varStatus="status">
					<!-- 选中项 -->
					<c:set var="_checked" value=""></c:set>
					<c:forEach items='${entry.userInputValueList}' var='userInputValue'>
						<c:if test="${userInputValue.options == itemValue.key}">
							<c:set var="_checked" value=" checked='checked'"></c:set>
						</c:if>
					</c:forEach>
				
					<!-- 默认选第一项 -->				
					<label><input type="radio" name="userCustom_${entry.id}" value="${itemValue.key}" ${_checked} <c:if test="${fn:length(entry.userInputValueList)==0 && status.count == 1}"> checked='checked'</c:if>>${itemValue.value}</label>
				</c:forEach>
				<SPAN class="span-help">${entry.tip}</SPAN>
			</c:if>
			<c:if test="${entry.chooseType ==3}">
				<c:forEach items="${entry.itemValue}" var="itemValue">
					<c:set var="_checked" value=""></c:set>
					<c:forEach items='${entry.userInputValueList}' var='userInputValue'>
						<c:if test="${userInputValue.options == itemValue.key}">
							<c:set var="_checked" value=" checked='checked'"></c:set>
						</c:if>
					</c:forEach>
				
				
					<label><input type="checkbox" name="userCustom_${entry.id}" value="${itemValue.key}" ${_checked}>${itemValue.value}</label>
				</c:forEach>
				<SPAN class="span-help">${entry.tip}</SPAN>
			</c:if>
			<c:if test="${entry.chooseType ==4}">
			
				<select class="form-select" name="userCustom_${entry.id}" <c:if test="${entry.multiple == true}"> multiple='multiple'</c:if> <c:if test="${entry.selete_size != null}"> size='${entry.selete_size}'</c:if>>
					<c:forEach items="${entry.itemValue}" var="itemValue">
						<c:set var="_selected" value=""></c:set>
						<c:forEach items='${entry.userInputValueList}' var='userInputValue'>
							<c:if test="${userInputValue.options == itemValue.key}">
								<c:set var="_selected" value=" selected='selected'"></c:set>
							</c:if>
						</c:forEach>
					
						<option value="${itemValue.key}" ${_selected}>${itemValue.value}</option>		
					</c:forEach>	
				</select>
				<SPAN class="span-help">${entry.tip}</SPAN>
			</c:if>
			<c:if test="${entry.chooseType ==5}">
				<textarea class="form-textarea" name="userCustom_${entry.id}" rows="${entry.rows}" cols="${entry.cols}"><c:forEach items='${entry.userInputValueList}' var='userInputValue'>${userInputValue.content}</c:forEach></textarea>			
				<SPAN class="span-help">${entry.tip}</SPAN>
			</c:if>
			<c:set var="userCustom_id" value="userCustom_${entry.id}"></c:set>
			<SPAN class="span-text">${error[userCustom_id]}</SPAN>
	    </TD>
	  </TR>
	  </c:forEach>
	<tr>
    <TD class="t-button" colSpan="4">
        <span class="submitButton"><INPUT type="button" id="submitForm" value="提交" onClick="javascript:sureSubmit(this.form);"></span>
  	</TD>
  </TR>
</TBODY></TABLE>
</DIV>
</form:form>
<script type="text/javascript">
$(function(){
	//JS日期控件
	var userRolesId_arr = document.getElementsByName("userRolesId");
	for(var i=0;i<userRolesId_arr.length;i++){
    	var userRolesId = userRolesId_arr[i].value;
    	
    	var obj = document.getElementById('validPeriodEnd_'+userRolesId);
    	if(obj != null){
    		 $('#validPeriodEnd_'+userRolesId).calendar({format:'yyyy-MM-dd HH:mm'});
    	}
    }
});
</script>
</BODY></HTML>
