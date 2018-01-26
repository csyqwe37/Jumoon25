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

	<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.subject.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} 
			
			else if(frm.content.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
</head>
  
  <body>
  	<div class="jumbotron">
  		<h1 class="display-3" align="center">공지사항 게시판</h1>
  	</div>
  	
  	<c:if test="${resultClass == null}">
  		<form action="noticeWrite2.do" method="post" enctype="multipart/form-data" onsubmit="return validation();">
  	</c:if>
  	<c:if test="${resultClass != null}">
  		<form action="noticeModifyAfter.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="notice_number" value="${resultClass.notice_number}" />
		<input type="hidden" name="currentPage" value="${currentPage}" />
		<input type="hidden" name="notice_filesav" value="${resultClass.notice_filesav}" />
  	</c:if>
  			
  			<legend>공지사항 작성</legend>
  			<div align="right">
  				<p class="text-muted"><font color="#FF0000">*</font>는 필수 입력사항입니다.</p>
  			</div>
  	
  		</tr>
    		<hr></hr>
		    <div class="form-group">
		      <label for="exampleInputTitle"><font color="#FF0000">*</font>제목</label>
		      <input type="text" class="form-control" id="exampleInputTitle1" name="notice_title" value="${resultClass.notice_title}" maxlength="50" placeholder="제목을 입력하세요."/>  
		    </div>
		    
		    <div class="form-group">
		      <label for="exampleInputWriter">&nbsp;작성자</label><br/>
		      <font style="width:100px" maxlength="20" color="#FF0000">ADMIN</font>
		    </div>
		 
		    <div class="form-group">
		      <label for="exampleTextarea"><font color="#FF0000">*</font>내용</label>
		      <textarea class="form-control" id="exampleTextarea" name="notice_content" rows="10" cols="50" placeholder="내용을 입력하세요.">${resultClass.notice_content}</textarea>
		    </div>
		    <div class="form-group">
		      <label for="exampleInputFile">&nbsp;첨부파일</label>
		      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file" name="upload">
		      <c:if test="${resultClass.notice_fileorg != NULL}">
			  		<small class="form-text text-muted" id="fileHelp">${resultClass.notice_fileorg}파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.</small>
			  </c:if>
		    </div>
    
    		<button class="btn btn-primary" type="submit">작성완료</button>
		</form>
  </body>
</html>

