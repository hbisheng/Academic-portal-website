<%@page import="edu.thu.cs.*"%>
<%@page import="jdbc.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	int course_id = Integer.parseInt(request.getParameter("cid"));
	int user_id = Integer.parseInt(request.getParameter("uid"));

	JdbcDao jdbc=null;
	try{
		jdbc = new JdbcDao();
		jdbc.delUserCourse(user_id,course_id);
		response.sendRedirect("choose.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>


</body>
</html>