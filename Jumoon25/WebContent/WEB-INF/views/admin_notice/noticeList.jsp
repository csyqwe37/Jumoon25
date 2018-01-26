<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
	<title>공지사항 게시판</title>
</head>
  
  <body>
  	<div class="jumbotron">
  		<h1 class="display-3" align="center">공지사항 게시판</h1>
  	</div>
  	
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">날짜</th>
      <th scope="col">조회</th>
    </tr>
  </thead>
  
  <tbody>
  	<c:forEach var="dto" items="${list}">
	    <tr class="table-primary">
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
	    
	    <tr align="right">
	    	<td colspan="5">
	    		<input type="button" value="글쓰기" class="btn btn-primary disabled" onClick="javascript:location.href='noticeWrite.do?currentPage=${currentPage}';">
	    	</td>
	    </tr>
  </tbody> 
</table> 
   </body>
</html>

