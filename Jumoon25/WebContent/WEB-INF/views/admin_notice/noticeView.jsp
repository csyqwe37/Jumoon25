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
	<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
	
</head>
  
  <body>
  	<div class="jumbotron">
  		<h1 class="display-3" align="center">공지사항 게시판</h1>
  	</div>
  	
	<table class="table table-hover">
  
	  <tbody>
	  	<tr class="table-primary">
	      <th scope="row" width="15%" align="left">번호(${resultClass.notice_number})</th>
	      <th scope="row" width="65%" align="center"><font style="color: black">제목&nbsp;&nbsp;:&nbsp;&nbsp;${resultClass.notice_title}</th>
	      <th scope="row" width="20%" align="right">글쓴이&nbsp;&nbsp;:&nbsp;&nbsp;<font style="width:100px" maxlength="20">ADMIN</font></th>
    	</tr>
		<tr>
	      <th scope="row">내용</th>
	      <td>
	      	<textarea rows="15" cols="180" readonly="readonly">${resultClass.notice_content}</textarea>
	      	
	      </td>
	      <td></td>
    	</tr>
    	<tr>
    	  <th scope="row" align="left" colspan="2" width="60%">첨부파일&nbsp;&nbsp;:&nbsp;&nbsp;
    	  	<a href="/Jumoon25/admin_notice/fileDownload.do?name=${resultClass.notice_filesav}">${resultClass.notice_fileorg}</a>
    	  </th>
	      <th scope="row" align="center" width="40%">조회수&nbsp;&nbsp;:&nbsp;&nbsp;${resultClass.notice_readcount}<br/>
	      	등록날짜&nbsp;&nbsp;:&nbsp;&nbsp;<fmt:formatDate value="${resultClass.notice_time}" pattern="yyyy-MM-dd HH:mm" />
	      </th>
    	</tr>
    	<c:if test="${sessionScope.ownerId == 'admin'}">
    		<tr>
    			<td align="right" colspan="3">
				<input name="list" type="button" value="수정" class="btn btn-primary disabled" onClick="javascript:location.href='noticeModifyBefore.do?notice_number=${resultClass.notice_number}&currentPage=${currentPage}'">
				<input name="list" type="button" value="삭제" class="btn btn-primary disabled" onClick="javascript:location.href='noticeDelete.do?notice_number=${resultClass.notice_number}&currentPage=${currentPage}'">
				<input name="list" type="button" value="목록" class="btn btn-primary disabled" onClick="javascript:location.href='noticeList.do?currentPage=${currentPage}'">
        		</td>
        	</tr>
    	</c:if>
	  </tbody> 
	</table>
	 
 </body>
</html>