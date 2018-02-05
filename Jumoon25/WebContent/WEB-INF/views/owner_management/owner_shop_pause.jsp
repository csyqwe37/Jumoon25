<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check==1}">
<script>
	alert("일시정지가 해제되었습니다.");
	window.location = "/Jumoon25/owner_management/owner_shop_management.do";
</script>
</c:if>
<c:if test="${check==0}">
<script>
	alert("일시정지 되었습니다.");
	window.location = "/Jumoon25/owner_management/owner_shop_management.do";
</script>
</c:if>