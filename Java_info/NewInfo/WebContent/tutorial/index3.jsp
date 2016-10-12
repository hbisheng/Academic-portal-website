<%@page import="edu.thu.cs.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="edu.thu.cs.StaticFunc;"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {

			//SimpleBean calculator = (SimpleBean) request
			//		.getAttribute("calculator");

			//out.print(calculator.getFirst() + calculator.getOperator()
			//		+ calculator.getSecond() + "=" + calculator.getResult());

			String a = request.getParameter("first_param");
			String b = request.getParameter("last_param");
			double c = StaticFunc.getRe(Double.valueOf(a),
					Double.valueOf(b));
			out.println(c);
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	<form action="index3.jsp" method="GET">
		<input type="text" name="first_param" /> + <input id="b" type="text"
			name="last_param" /> <input type="submit" value="跳转" />
	</form>
</body>
</html>