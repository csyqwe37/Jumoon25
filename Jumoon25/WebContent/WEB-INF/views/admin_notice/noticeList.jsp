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
	<title>공지사항 게시판</title>
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
  		<h1 class="display-3" align="center">공지사항 게시판</h1>
  	</div>
  	
	<table class="table table-hover">
  <thead>
    <tr class="table-primary">
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">날짜</th>
      <th scope="col">조회</th>
    </tr>
  </thead>
  
  <tbody>
  	<c:forEach var="dto" items="${list}">
	    <tr>
	      <th scope="row">${dto.notice_number}</th>
	      <td><a href="noticeView.do?notice_number=${dto.notice_number}&currentPage=${currentPage}">${dto.notice_title}</a></td>
	      <td>ADMIN</td>
	      <td><fmt:formatDate value="${dto.notice_time}" type="date"/></td>
	      <td>${dto.notice_readcount}</td>
	    </tr>
	</c:forEach>
	
	<c:if test="${list.size() <= 0}">
	    <tr class="table-dark"align="center">
			<th scope="row" colspan="5" >등록된 게시물이 없습니다.</th>
        </tr>					
  	</c:if>
  	
  		<tr align="center">
				  <th scope="row" colspan="5">${pagingHtml}</th>	  
				  
    
				  
	    </tr>
	    
	    <c:if test="${sessionScope.ownerId == 'admin'}">
	    	<tr align="right">
		    	<td colspan="5">
		    		<input type="button" value="글쓰기" class="btn btn-primary disabled" onClick="javascript:location.href='noticeWrite.do?currentPage=${currentPage}';">
		    	</td>
	    	</tr>
	    </c:if>
	 
  </tbody> 
</table> 
	</div>
<%@ include file="../module/bottom.jsp"%>
   </body>
</html>

