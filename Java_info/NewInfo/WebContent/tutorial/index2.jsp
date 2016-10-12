<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<jsp:useBean id="calculator" scope="request"
	class="edu.thu.cs.SimpleBean">
	<jsp:setProperty name="calculator" property="*" />
</jsp:useBean>
<jsp:useBean id="time" scope="request" class="java.util.Date">
</jsp:useBean>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>计算器</title>
</head>
<body>
	<%
		try {
			out.println(time.toString());
			calculator.calculate();
			out.print(calculator.getFirst() + calculator.getOperator()
					+ calculator.getSecond() + "=" + calculator.getResult());
		} catch (Exception e) {
			System.out.print(e);
		}
	%>
	<hr>
	<form name="form1" action="index2.jsp">
		<table width="75" border="1" bordercolor="#003300">
			<tr bgcolor="#999999">
				<td colspan="2">simple calculator</td>
			</tr>
			<tr>
				<td>第一个操作数</td>
				<td><input type=text name="first"></td>
			</tr>
			<tr>
				<td>操作符</td>
				<td><select name="operator">
						<option value="+">+</option>
						<option value="-">-</option>
						<option value="*">*</option>
						<option value="/">/</option>
				</select></td>
			</tr>

			<tr>
				<td>第二个操作数</td>
				<td><input type=text name="second"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#cccccc"><input type=submit value="计算"></td>
			</tr>
		</table>
	</form>

</body>
</html>
