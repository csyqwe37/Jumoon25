<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
	<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
	<title>비승인 사업주 리스트</title>
	<style type="text/css">
html, body {
   height: 100%;
}

.wrap {
   min-height: 100%;
   position: relative;
   margin-bottom:-60px;
   padding-bottom:60px;
}

.footer {
   margin-top:10px;
   bottom: 0;
   width: 100%;
   height: 50px;
   color: white;
   background-color: #333333;
   position: relative;
}
</style>
</head>
  
  <body>
  <div class="wrap">
<%@ include file="../module/top_owner.jsp"%>
  	<div class="jumbotron">
  		<h1 class="display-3" align="center">비승인 사업주 리스트</h1>
  	</div>
  	
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">성별</th>
      <th scope="col">생년월일</th>
      <th scope="col">전화번호</th>
      <th scope="col">주소</th>
      <th scope="col">사업승인</th>
    </tr>
  </thead>
  
  <tbody>
  	<c:forEach var="dto" items="${list}">
	    <tr class="table-primary">
	      <td>${dto.owner_id}</td>
	      <td>${dto.owner_name}</td>
	      <td>${dto.owner_sex}</td>
	      <td>${dto.owner_birth}</td>
	      <td>${dto.owner_phone}</td>
	      <td>${dto.owner_address1}</td>
	      <td>  	
	   		<input name="enable" type="button" value="승인허가" class="btn btn-primary" onClick="javascript:location.href='permissionProEnable.do?owner_id=${dto.owner_id}&currentPage=${currentPage}'">
	      </td>
	    </tr>
	</c:forEach>
	
	<c:if test="${list.size() <= 0}">
	    <tr class="table-dark"align="center">
			<th scope="row" colspan="7" >승인되지않은 사장님이 없습니다.</th>
        </tr>					
  	</c:if>
  	
  		<tr align="center">
				  <th scope="row" colspan="7">${pagingHtml}</th>	  
				  
	    </tr>
  </tbody> 
</table> 
</div>
<%@ include file="../module/bottom.jsp"%>
   </body>
</html>

