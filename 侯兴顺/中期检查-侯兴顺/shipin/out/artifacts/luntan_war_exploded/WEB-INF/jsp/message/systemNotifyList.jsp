<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<base href="${config:url(pageContext.request)}">
<TITLE>系统通知管理</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf_token" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link href="backstage/css/list.css" type="text/css" rel="stylesheet"/>
<link href="backstage/css/table.css" type="text/css" rel="stylesheet"/>
<script language="javascript" src="backstage/js/Tool.js" type="text/javascript"></script>
<script language="javascript" src="backstage/js/ajax.js" type="text/javascript"></script>

</HEAD>
<script type="text/javascript">

//删除在线留言
function deleteSystemNotify(id){
	var parameter = "";

	parameter += "&systemNotifyId="+id;

	var csrf =  getCsrf();
	parameter += "&_csrf_token="+csrf.token;
	parameter += "&_csrf_header="+csrf.header;

   	//删除第一个&号,防止因为多了&号而出现警告: Parameters: Invalid chunk ignored.信息
	if(parameter.indexOf("&") == 0){
		parameter = parameter.substring(1,parameter.length);
	}
   	post_request(function(value){
		if(value == "1"){
			window.location.reload();
		}else{
			alert("删除失败");
		}
	},
		"${config:url(pageContext.request)}control/systemNotify/manage${config:suffix()}?method=delete&timestamp=" + new Date().getTime(), true,parameter);
}


</script>
<BODY>
<!-- IE6 会弹出'已终止操作'错误，本JS要放在Body标签下面 -->
<script type="text/javascript" src="backstage/spin/spin.min.js" ></script>
<DIV class="d-box">
<div class="d-button">
<input class="functionButton" type="button" onClick="javascript:window.location.href='${config:url(pageContext.request)}control/systemNotify/manage${config:suffix()}?method=add'" value="添加系统通知">
</div>


<form:form>
<TABLE class="t-list-table" cellSpacing="1" cellPadding="0" width="100%" border="0">
  <THEAD class="t-list-thead">
  <TR>
    <TH width="20%">员工名称</TH>
    <TH width="50%">通知内容</TH>
    <TH width="15%">日期</TH>
    <TH width="15%">操作</TH>
    </TR></THEAD>
  <TBODY class="t-list-tbody" align="center">
   <c:forEach items="${pageView.records}" var="entry">
	  <TR >	    
	    <TD>
	    	${entry.staffName}
		</TD>
		<TD><enhance:out escapeXml="false">${entry.content}</enhance:out></TD>
	    <TD><fmt:formatDate value="${entry.sendTime}"  pattern="yyyy-MM-dd HH:mm:ss"/></TD>
	    <TD>
	    	<a href="${config:url(pageContext.request)}control/systemNotify/manage${config:suffix()}?method=edit&systemNotifyId=${entry.id}&page=${param.page}">修改</a>
	    	<a hidefocus="true" onClick="javascript:if(window.confirm('确定删除吗? ')){deleteSystemNotify('${entry.id}'); return false}else{return false}" href="#" ondragstart= "return false">删除</a>
	    </TD>
	  </TR>
	 </c:forEach>
  </TBODY>
</TABLE>
<!-- 分页栏开始 -->
  	<%@ include file="/WEB-INF/jsp/common/page.jsp" %>
<!-- 分页栏结束 -->
</form:form>
</DIV></BODY></HTML>
