<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
		<form name="loginForm" action=<c:url value='j_spring_security_check'/> method="POST">
				<table>
						<tr>
							<td colspan="2">Login</td>
						</tr>
						<tr>
							<td colspan="2" style="color:red" > <c:if test="${not empty error }">${error}></c:if> </td>
						</tr>
						
						<tr>
							<td> Usuario:</td>
							<td> <input type="text"	 name="usuario"> </td>
						</tr>
						<tr>
							<td> Contraseña:</td>
							<td> <input type="password"	 name="password"> </td>
						</tr>
						<tr>
							<td></td>
							<td> <input type="submit"	 value="login"> </td>
						</tr>
				</table>
		</form>
</body>
</html>