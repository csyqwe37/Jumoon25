<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="jumoon25.client.bean.ClientDTO"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>매출 관리</title>
	<jsp:useBean id="dto" class="jumoon25.client.bean.ClientDTO"/>
	<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
</head>
<body>

	<%
	dto = (ClientDTO)session.getAttribute("LOGININFO");
	%>

<div id="header">
    		<div id="warp">
		<div id="top">
		<%if(dto != null){ %>
		<img src="<%=dto.getClient_image() %>" width="40" height="40">&nbsp;
		<Strong><%=dto.getClient_name() %>
		<font color="blue">(<%=dto.getClient_id() %>)</font>
		</Strong>님 환영합니다/<a href="kakaoLogout.do">로그아웃</a>
		<%}else{ %>
		<jsp:include page="kakaoLogin.jsp"/>
		<%} %>
	</div>
</div>
	<input type="button" class="btn btn-primary disabled" name="api" value="api" 
	onclick="javascript:window.location='/Jumoon25/admin_revenueManagement/api.do'"/>
	<br/>
	<input type="button" class="btn btn-primary disabled" name="kakao" value="kakao" 
	onclick="javascript:window.location='/Jumoon25/admin_revenueManagement/kakao.do'"/>

</body>
</html>