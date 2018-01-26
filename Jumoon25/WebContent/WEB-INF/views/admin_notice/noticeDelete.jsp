<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시판</title>
	<script type="text/javascript">
		function deleteCheck(){
			alert('선택하신 게시물이 삭제되었습니다.');
			location.href('noticeList.do?currentPage=1');
		}
	</script>
</head>
<body>
	<script>deleteCheck()</script>
</body>
</html>