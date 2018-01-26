<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>관리자</title>
	</head>
	<body>
		<h2>관리자 페이지</h2>
		<input type="button" value="게시판" onclick="javascript:window.location='/Jumoon25/admin_notice/noticeList.do?currentPage=1'">
		<input type="button" value="사장님 관리" onclick="javascript:window.location='/Jumoon25/admin_ownerManagement/ownerList.do?currentPage=1'">		
	</body>
</html>