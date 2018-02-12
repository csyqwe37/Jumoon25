<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추가 정보 입력란</title>
	<link href="/Jumoon25/design/bootswatch/bootstrap.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/bootstrap.min.css" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_bootswatch.scss" rel="stylesheet">
	<link href="/Jumoon25/design/bootswatch/_variables.scss" rel="stylesheet">
	<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			 
			if(!frm.client_sex[0].checked && !frm.client_sex[1].checked) {
				alert("성별을 선택해주세요.");
				return false;
			} 
			else if(frm.client_phone.value == "") {
				alert("전화번호를 입력해주세요.");
				return false;			
			} 
			else if(frm.client_address.value == "") {
				alert("주소를 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
</head>
<body>
	
	<div class="jumbotron">
  		<h1 class="display-3" align="center">배송을 위한 추가정보 입력란</h1>
  	</div>
  	
  	<form action="clientInfo.do" method="post" enctype="multipart/form-data" onsubmit="return validation();">
  			<legend>고객님의 성별과 전화번호 그리고 주소를 기입해주세요.</legend>
  			<div align="right">
  				<p class="text-muted"><font color="#FF0000">*</font>는 필수 입력사항입니다.</p>
  			</div>
    		<hr>
    		
    		<div class="form-group">
		      <label for="exampleInputTitle"><font color="#FF0000">*</font>아이디</label>
		      <input type="text" class="form-control" id="exampleInputTitle1" name="client_id" value="${dto.client_id}" disabled="disabled"/>  
		    </div>
		    <div class="form-group">
		      <label for="exampleInputTitle"><font color="#FF0000">*</font>이름</label>
		      <input type="text" class="form-control" id="exampleInputTitle1" name="client_name" value="${dto.client_name}" disabled="disabled"/>  
		    </div>
		    <div class="form-group">
		      <input type="hidden" name="client_image" value="${dto.client_image}"/>  
		    </div>
		    
    		<label for="exampleInputTitle"><font color="#FF0000">*</font>성별</label>
		    <div class="form-check">
		        <label class="form-check-label">
		        	<input type="radio" class="form-check-input" name="client_sex" id="male" value="남성">
		         	남성
		      	</label>
		    </div>
		    <div class="form-check">
		      <label class="form-check-label">
		          <input type="radio" class="form-check-input" name="client_sex" id="female" value="여성">
		          	여성
		      </label>
      		</div>
		    <br/>
		    <div class="form-group">
		      <label for="exampleInputTitle"><font color="#FF0000">*</font>전화번호</label>
		      <input type="text" class="form-control" id="exampleInputTitle1" name="client_phone" value="${dto.client_phone}" maxlength="50" placeholder="전화번호를 입력하세요."/>  
		    </div>
		    
		    <div class="form-group">
		      <label for="exampleInputTitle"><font color="#FF0000">*</font>주소</label>
		      <input type="text" class="form-control" id="exampleInputTitle1" name="client_address" value="${dto.client_address}" maxlength="100" placeholder="주소를 입력하세요."/>  
		    </div>
		   
		   <div class="form-group">
		   	  <input type="hidden" name="client_id" value="${dto.client_id}" />
		   	  <input type="hidden" name="client_name" value="${dto.client_name}" />
		   	  <input type="hidden" name="client_image" value="${dto.client_image}" />
		   </div>
    		<button class="btn btn-primary" type="submit">작성완료</button>
		</form> 
</body>
</html>