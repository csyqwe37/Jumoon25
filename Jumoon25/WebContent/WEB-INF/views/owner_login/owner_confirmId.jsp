<%@ page contentType="text/html;charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>ID �ߺ�Ȯ��</title>

<fmt:requestEncoding value="utf-8" />
<body>
	<c:if test="${check==1}">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td height="39">${id}�� �̹� ������� ���̵��Դϴ�.</td>
			</tr>
		</table>
		<form name="checkForm" method="post" action="/Jumoon25/owner_login/owner_confirmId.do">
			<table width="270" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center">�ٸ� ���̵� �����ϼ���.
						<p>
							<input type="text" size="10" maxlength="12" name="id"> <input
								type="submit" value="ID�ߺ�Ȯ��">
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${check!=1}">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">
					<p>
						�Է��Ͻ� ${id}�� ����Ͻ� �� �ִ� ID�Դϴ�.
					</p> <input type="button" value="�ݱ�" onclick="setid()">
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>

<script language="javascript">
  function setid()
    {		
    	opener.document.ownerinput.owner_id.value="${id}";
		self.close();
	}
</script>
